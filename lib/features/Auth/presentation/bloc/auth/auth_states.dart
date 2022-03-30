
import 'package:freezed_annotation/freezed_annotation.dart';
part 'auth_states.freezed.dart';
@Freezed()
class AuthState with _$AuthState {

  factory AuthState.initial()= _Initial;
  factory AuthState.loading()= _Loading;
  factory AuthState.login()= _login;
  factory AuthState.logout()= _logout;
  factory AuthState.error({required String errorMessage})= _Error;

}