part of 'location_cubit.dart';

sealed class LocationState {}

final class LocationInitial extends LocationState {}

final class LocationLoading extends LocationState {}

final class LocationSuccess extends LocationState {
  final List<LocationModel> locations;
  LocationSuccess(this.locations);
}

final class LocationFailed extends LocationState {
  final String message;
  LocationFailed(this.message);
}
