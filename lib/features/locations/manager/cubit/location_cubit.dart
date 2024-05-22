import 'package:fixer_admin_panel_app/features/locations/data/models/location_model.dart';
import 'package:fixer_admin_panel_app/features/locations/data/repos/location_repo_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
final LocationRepoImpl repo;
  LocationCubit(this.repo) : super(LocationInitial());
  static LocationCubit get(context) => BlocProvider.of(context);
  
  List<LocationModel> locations = [];

  void getLocations() async {
    emit(LocationLoading());
    final response = await repo.getLocations();
    response.fold(
      (l) {
        emit(LocationFailed(l.message));
      },
      (r) {
        locations = r;
        emit(LocationSuccess(r));
      },
    );
  }
}
