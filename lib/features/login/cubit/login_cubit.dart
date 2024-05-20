import 'package:fixer_admin_panel_app/core/networks/api_services/errors/error_snackbar.dart';
import 'package:fixer_admin_panel_app/features/login/data/repos/login_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepository repo;
  LoginCubit(this.repo) : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);

  void login(String email, String password, context) async {
    emit(LoginLoading());
    final response = await repo.login(email, password);
    response.fold(
      (l) {
        showErrorSnackbar(context, l.message);
        emit(LoginFailed(l.message));
      },
      (r) {
        emit(LoginSuccess(""));
      },
    );
  }
}