part of 'admin_cubit.dart';

sealed class AdminState {}

final class AdminInitial extends AdminState {}

final class AdminLoading extends AdminState {}

final class AdminSuccess extends AdminState {
  final List<AdminModel> admins;

  AdminSuccess(this.admins);
}

final class AdminFailed extends AdminState {
  final String message;

  AdminFailed(this.message);
}
