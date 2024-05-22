part of 'crafts_men_cubit.dart';

sealed class CraftsMenState {}

final class CraftsMenInitial extends CraftsMenState {}

final class CraftsMenLoading extends CraftsMenState {}

final class CraftsMenSuccess extends CraftsMenState {
  final List<CraftsmanModel> craftsMen;
  CraftsMenSuccess(this.craftsMen);
}

final class CraftsMenFailed extends CraftsMenState {
  final String message;

  CraftsMenFailed(this.message);
}

final class CraftsMenAcceptLoading extends CraftsMenState {}

final class CraftsMenAcceptSuccess extends CraftsMenState {
  final String message;

  CraftsMenAcceptSuccess(this.message);
}

final class CraftsMenAcceptFailed extends CraftsMenState {
  final String message;

  CraftsMenAcceptFailed(this.message);
}

