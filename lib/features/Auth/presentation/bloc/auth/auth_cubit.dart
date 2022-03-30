
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:mega_trust_project/core/usecase/usecase.dart';
import 'package:mega_trust_project/features/Auth/domain/usecases/is_token_saved.dart';
import 'package:mega_trust_project/features/Auth/domain/usecases/logout.dart';
import 'package:mega_trust_project/features/Auth/presentation/bloc/auth/auth_states.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._getToken, this._logout) : super(AuthState.initial());

  final GetToken _getToken;
  final Logout _logout;

  Future<void> getToken() async {
    print("start");

    emit(AuthState.loading());
    print("state : $state");

    final result = await _getToken(NoParams());
    result.fold((error) => emit(AuthState.error(errorMessage: error.e)),
        (token) {
      if (token != null) {
        emit(AuthState.login());
      } else {
        emit(AuthState.logout());
      }
    });
    print("end");
    print("state : $state");
  }

  Future<void> logout() async {
    emit(AuthState.loading());
    final result = await _logout(NoParams());

    result.fold(
      (error) => emit(AuthState.error(errorMessage: error.e)),
      (r) {
        emit(AuthState.logout());
      },
    );
  }
}
