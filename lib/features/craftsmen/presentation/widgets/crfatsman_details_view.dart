// ignore_for_file: library_private_types_in_public_api

import 'package:fixer_admin_panel_app/core/helpers/spacing.dart';
import 'package:fixer_admin_panel_app/core/networks/api_services/errors/error_snackbar.dart';
import 'package:fixer_admin_panel_app/core/routing/app_router.dart';
import 'package:fixer_admin_panel_app/core/service_provider/service_provider.dart';
import 'package:fixer_admin_panel_app/core/themes/text_styles.dart';
import 'package:fixer_admin_panel_app/core/widgets/widgets.dart';
import 'package:fixer_admin_panel_app/features/craftsmen/data/models/craftsman_model.dart';
import 'package:fixer_admin_panel_app/features/craftsmen/data/repos/craftsmen_repo_imp.dart';
import 'package:fixer_admin_panel_app/features/craftsmen/manager/cubit/crafts_men_cubit.dart';
import 'package:fixer_admin_panel_app/features/craftsmen/presentation/widgets/rejection_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CraftsmanDetails extends StatefulWidget {
  final CraftsmanModel model;
  const CraftsmanDetails({super.key, required this.model});

  @override
  _CraftsmanDetailsState createState() => _CraftsmanDetailsState();
}

class _CraftsmanDetailsState extends State<CraftsmanDetails> {
  bool? _approvalStatus;

  void _handleRadioValueChange(bool? value) {
    setState(() {
      _approvalStatus = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => CraftsMenCubit(getIt<CraftsmenRepoImpl>()),
      child: BlocBuilder<CraftsMenCubit, CraftsMenState>(
        builder: (context, state) {
          CraftsMenCubit cubit = CraftsMenCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(
                widget.model.name!,
                style: TextStyles.headings,
              ),
              centerTitle: true,
            ),
            body: Center(
              child: SizedBox(
                height: size.height * 0.9,
                width: size.width * 0.4,
                child: Card(
                  elevation: 2,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.06,
                            vertical: size.height * 0.04),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "User Name :",
                                  style: TextStyles.normal
                                      .copyWith(color: Colors.grey),
                                ),
                                const Spacer(),
                                Text(
                                  widget.model.username!,
                                  style: TextStyles.normal,
                                ),
                              ],
                            ),
                            verticalSpace(size.height * 0.05),
                            Row(
                              children: [
                                Text(
                                  "Email :",
                                  style: TextStyles.normal
                                      .copyWith(color: Colors.grey),
                                ),
                                const Spacer(),
                                Text(
                                  widget.model.email!,
                                  style: TextStyles.normal,
                                ),
                              ],
                            ),
                            verticalSpace(size.height * 0.05),
                            Row(
                              children: [
                                Text(
                                  "Phone Number :",
                                  style: TextStyles.normal
                                      .copyWith(color: Colors.grey),
                                ),
                                const Spacer(),
                                Text(
                                  widget.model.phone!,
                                  style: TextStyles.normal,
                                ),
                              ],
                            ),
                            if (widget.model.frontImage != null)
                              verticalSpace(size.height * 0.05),
                            if (widget.model.frontImage != null)
                              Row(
                                children: [
                                  Text(
                                    "Front Id :",
                                    style: TextStyles.normal
                                        .copyWith(color: Colors.grey),
                                  ),
                                  const Spacer(),
                                  SizedBox(
                                      height: size.height * 0.15,
                                      width: size.width * 0.15,
                                      child: Image.network(
                                        widget.model.frontImage!,
                                        fit: BoxFit.cover,
                                      )),
                                ],
                              ),
                            if (widget.model.backImage != null)
                              verticalSpace(size.height * 0.05),
                            if (widget.model.backImage != null)
                              Row(
                                children: [
                                  Text(
                                    "Back Id :",
                                    style: TextStyles.normal
                                        .copyWith(color: Colors.grey),
                                  ),
                                  const Spacer(),
                                  SizedBox(
                                      height: size.height * 0.15,
                                      width: size.width * 0.15,
                                      child: Image.network(
                                        widget.model.backImage!,
                                        fit: BoxFit.cover,
                                      )),
                                ],
                              ),
                          ],
                        ),
                      ),
                      verticalSpace(size.height * 0.01),
                      Container(
                        width: double.infinity,
                        height: 2,
                        color: const Color(0xffE0E9F2),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.06,
                            vertical: size.height * 0.04),
                        child: Column(
                          children: [
                            Text(
                              "Your Decision",
                              style: TextStyles.headings,
                            ),
                            verticalSpace(size.height * 0.01),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Radio<bool>(
                                  value: true,
                                  groupValue: _approvalStatus,
                                  onChanged: _handleRadioValueChange,
                                ),
                                const Text("Approved"),
                                horizontalSpace(size.width * 0.02),
                                Radio<bool>(
                                  value: false,
                                  groupValue: _approvalStatus,
                                  onChanged: _handleRadioValueChange,
                                ),
                                const Text("Rejected"),
                              ],
                            ),
                            verticalSpace(size.height * 0.05),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                defaultButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    text: "Cancel",
                                    size: size,
                                    hasEdges: true),
                                horizontalSpace(size.width * 0.01),
                                if (state is CraftsMenAcceptLoading)
                                  const CircularProgressIndicator(),
                                if (state is! CraftsMenAcceptLoading)
                                  defaultButton(
                                      onPressed: () {
                                        if (_approvalStatus == false) {
                                          navigateTo(
                                              context,
                                              RejectionView(
                                                craftsman: widget.model,
                                              ));
                                        } else if (_approvalStatus == true) {
                                          cubit.acceptCraftsman(
                                              widget.model.id!, context);
                                        } else {
                                          showErrorSnackbar(context,
                                              "Please Select An option");
                                        }
                                      },
                                      text: "Submit",
                                      size: size),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
