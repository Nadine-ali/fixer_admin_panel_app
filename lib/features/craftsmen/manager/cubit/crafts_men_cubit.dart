import 'package:fixer_admin_panel_app/features/craftsmen/data/models/craftsman_model.dart';
import 'package:fixer_admin_panel_app/features/craftsmen/data/repos/craftsmen_repo_imp.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'crafts_men_state.dart';

class CraftsMenCubit extends Cubit<CraftsMenState> {
  final CraftsmenRepoImpl repo;
  CraftsMenCubit(this.repo) : super(CraftsMenInitial());

  static CraftsMenCubit get(context) => BlocProvider.of(context);

List<CraftsmanModel> craftsmanList = [];

  void getCraftsmen() async {
    emit(CraftsMenLoading());
    final response = await repo.getCraftsmen();
    response.fold(
      (l) {
        emit(CraftsMenFailed(l.message));
      },
      (r) {
        craftsmanList = r;
        emit(CraftsMenSuccess(r));
      },
    );
  }
}
