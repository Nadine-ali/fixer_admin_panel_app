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
