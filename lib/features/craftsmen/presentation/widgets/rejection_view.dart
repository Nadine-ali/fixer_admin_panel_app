import 'package:fixer_admin_panel_app/core/helpers/spacing.dart';
import 'package:fixer_admin_panel_app/core/service_provider/service_provider.dart';
import 'package:fixer_admin_panel_app/core/themes/text_styles.dart';
import 'package:fixer_admin_panel_app/core/widgets/widgets.dart';
import 'package:fixer_admin_panel_app/features/craftsmen/data/models/craftsman_model.dart';
import 'package:fixer_admin_panel_app/features/craftsmen/data/repos/craftsmen_repo_imp.dart';
import 'package:fixer_admin_panel_app/features/craftsmen/manager/cubit/crafts_men_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RejectionView extends StatelessWidget {
  final CraftsmanModel craftsman;
  const RejectionView({super.key, required this.craftsman});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    TextEditingController titleController = TextEditingController();
    TextEditingController reasonController = TextEditingController();
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => CraftsMenCubit(getIt<CraftsmenRepoImpl>()),
      child: BlocBuilder<CraftsMenCubit, CraftsMenState>(
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            title: Text(
              'Rejection Form',
              style: TextStyles.headings,
            ),
            centerTitle: true,
          ),
          body: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Craftsman Name: ${craftsman.name}',
                    style: TextStyles.headings,
                  ),
                  verticalSpace(50),
                  Text(
                    'Title',
                    style: TextStyles.normal,
                  ),
                  verticalSpace(20),
                  TextFormField(
                    controller: titleController,
                    maxLines: 2,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter the title';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter the title',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  verticalSpace(50),
                  Text(
                    'Reason for Rejection',
                    style: TextStyles.normal,
                  ),
                  verticalSpace(20),
                  TextFormField(
                    controller: reasonController,
                    maxLines: 10,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter the reason for rejection';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter the reason for rejection',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  verticalSpace(50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (state is! CraftsMenRejectLoading)
                        defaultButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                CraftsMenCubit.get(context).rejectCraftsman(
                                    craftsman.id!,
                                    titleController.text,
                                    reasonController.text,
                                    context);
                              }
                            },
                            text: "Submit",
                            size: size),
                      if (state is CraftsMenRejectLoading)
                        const CircularProgressIndicator(),
                      horizontalSpace(20),
                      defaultButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          text: "Cancel",
                          size: size,
                          hasEdges: true)
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
