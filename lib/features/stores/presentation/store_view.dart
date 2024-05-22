import 'package:fixer_admin_panel_app/core/service_provider/service_provider.dart';
import 'package:fixer_admin_panel_app/features/stores/data/repos/stores_repo_impl.dart';
import 'package:fixer_admin_panel_app/features/stores/manager/cubit/stores_cubit.dart';
import 'package:fixer_admin_panel_app/features/stores/presentation/add_store.dart';
import 'package:fixer_admin_panel_app/features/stores/presentation/all_stores_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

String storePage = "Stores";

class StroeView extends StatefulWidget {
  const StroeView({super.key});

  @override
  State<StroeView> createState() => _StroeViewState();
}

class _StroeViewState extends State<StroeView> {
  @override
  Widget build(BuildContext context) {
    return storePage == "Stores"
        ? AllStores(
            onChanged: () {
              setState(() {
                storePage = "addStore";
              });
            },
          )
        : BlocProvider(
            create: (context) => StoresCubit(getIt<StoresRepoImpl>()),
            child: BlocBuilder<StoresCubit, StoresState>(
              builder: (context, state) {
                return AddStore(
                  onCancel: () {
                    setState(() {
                      storePage = "Stores";
                    });
                  },
                  onContinue: () {
                    setState(() {
                      storePage = "Stores";
                    });
                  },
                );
              },
            ),
          );
  }
}
