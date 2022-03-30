
import 'package:freezed_annotation/freezed_annotation.dart';
part 'register_states.freezed.dart';

@Freezed()
 class RegisterState with _$RegisterState {

  factory RegisterState.initial()= _Initial;
  factory RegisterState.loading()= _Loading;
  factory RegisterState.success()= _Success;
  factory RegisterState.error({required String errorMessage})= _Error;

}


