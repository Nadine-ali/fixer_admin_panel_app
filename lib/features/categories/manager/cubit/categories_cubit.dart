import 'package:fixer_admin_panel_app/core/networks/api_services/errors/error_snackbar.dart';
import 'package:fixer_admin_panel_app/features/categories/data/models/service_model/service_model.dart';
import 'package:fixer_admin_panel_app/features/categories/data/repos/categories_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final CategoriesRepo categoriesRepo;
  CategoriesCubit(this.categoriesRepo) : super(CategoriesInitial());

  static CategoriesCubit get(context) => BlocProvider.of(context);

  List<ServiceModel> services = [];

  Future<void> viewCategoryServices(int category) async {
    emit(GetCategoryServicesLoading());
    final response = await categoriesRepo.viewCategoryServices(category);
    response.fold(
      (l) => emit(GetCategoryServicesFailed(l.message)),
      (r) {
        services = r;
        emit(GetCategoryServicesSuccess(r));
      },
    );
  }

  Future<void> addService(
      String name, int price, String category, context) async {
    emit(AddServiceLoading());
    final response = await categoriesRepo.addService(name, price, category);
    response.fold(
      (l) {
        showErrorSnackbar(context, l.message.toString());
        emit(AddServiceFailed(l.message));
      },
      (r) {
        emit(AddServiceSuccess(r));
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.green,
            content: Text('Added !'),
          ),
        );
      },
    );
  }

  Future<void> deleteService(int id, context) async {
    emit(DeleteServiceLoading());
    final response = await categoriesRepo.deleteService(id);
    response.fold(
      (l) {
        showErrorSnackbar(context, l.message.toString());
        emit(DeleteServiceFailed(l.message));
      },
      (r) {
        emit(DeleteServiceSuccess(r));
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.green,
            content: Text('Deleted !'),
          ),
        );
      },
    );
  }
}
