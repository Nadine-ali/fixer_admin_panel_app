part of 'dashboard_cubit.dart';

sealed class DashboardState {}

final class DashboardInitial extends DashboardState {}

final class DashboardLoading extends DashboardState {}

final class DashboardSuccess extends DashboardState {
  final List<MessageModel> messages;
  DashboardSuccess(this.messages);
}

final class DashboardFailed extends DashboardState {
  final String message;
  DashboardFailed(this.message);
}
