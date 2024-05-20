import 'package:fixer_admin_panel_app/features/Dashboard/data/models/messege_model.dart';
import 'package:fixer_admin_panel_app/features/Dashboard/data/repos/dashboard_repo_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  final DashBoardRepoImpl repoImpl;
  DashboardCubit(this.repoImpl) : super(DashboardInitial());
  static DashboardCubit get(context) => BlocProvider.of(context);

  List<MessageModel> messages = [];

  void getDashboardData() async {
    emit(DashboardLoading());
    final response = await repoImpl.getDashboardData();
    response.fold(
      (l) {
        emit(DashboardFailed(l.message));
      },
      (r) {
        messages = r;
        emit(DashboardSuccess(r));
      },
    );
  }
}
