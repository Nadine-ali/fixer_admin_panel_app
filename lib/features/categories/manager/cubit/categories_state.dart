part of 'categories_cubit.dart';

sealed class CategoriesState {}

final class CategoriesInitial extends CategoriesState {}

final class GetCategoryServicesLoading extends CategoriesState {}

final class GetCategoryServicesSuccess extends CategoriesState {
  final List<ServiceModel> services;
  GetCategoryServicesSuccess(this.services);
}

final class GetCategoryServicesFailed extends CategoriesState {
  final String message;
  GetCategoryServicesFailed(this.message);
}

final class AddServiceLoading extends CategoriesState {}

final class AddServiceSuccess extends CategoriesState {
  final ServiceModel service;
  AddServiceSuccess(this.service);
}

final class AddServiceFailed extends CategoriesState {
  final String message;
  AddServiceFailed(this.message);
}
