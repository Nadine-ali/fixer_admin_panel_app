import 'package:fixer_admin_panel_app/features/admin/data/models/admin_model.dart';
import 'package:fixer_admin_panel_app/features/admin/data/repos/admin_repo_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'admin_state.dart';

class AdminCubit extends Cubit<AdminState> {
  final AdminRepoImpl repo;
  AdminCubit(this.repo) : super(AdminInitial());
  static AdminCubit get(context) => BlocProvider.of(context);

  List<AdminModel> admins = [];

  void getAdmins() async {
    emit(AdminLoading());
    final response = await repo.getAdmins();
    response.fold(
      (l) {
        emit(AdminFailed(l.message));
      },
      (r) {
        admins = r;
        emit(AdminSuccess(r));
      },
    );
  }
}
