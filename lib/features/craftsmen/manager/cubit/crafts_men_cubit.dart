import 'package:fixer_admin_panel_app/core/networks/api_services/errors/error_snackbar.dart';
import 'package:fixer_admin_panel_app/features/craftsmen/data/models/craftsman_model.dart';
import 'package:fixer_admin_panel_app/features/craftsmen/data/repos/craftsmen_repo_imp.dart';
import 'package:flutter/material.dart';
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

  void acceptCraftsman(int id, context) async {
    emit(CraftsMenAcceptLoading());
    final response = await repo.acceptCraftsman(id);
    response.fold(
      (l) {
        showErrorSnackbar(context, l.message);
        emit(CraftsMenAcceptFailed(l.message));
      },
      (r) {
        showErrorSnackbar(context, r);
        Navigator.pop(context);
        emit(CraftsMenAcceptSuccess(r));
      },
    );
  }

  void rejectCraftsman(int id, String subject, String body, context) async {
    emit(CraftsMenRejectLoading());
    final response = await repo.rejectCraftsman(id, subject, body);
    response.fold(
      (l) {
        showErrorSnackbar(context, l.message);
        emit(CraftsMenRejectFailed(l.message));
      },
      (r) {
        showErrorSnackbar(context, r);
        Navigator.pop(context);
        Navigator.pop(context);
        emit(CraftsMenRejectSuccess(r));
      },
    );
  }
}
