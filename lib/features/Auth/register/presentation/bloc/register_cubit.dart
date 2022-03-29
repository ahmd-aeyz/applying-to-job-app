
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:mega_trust_project/features/Auth/register/domain/entities/registeration_input_entity.dart';
import 'package:mega_trust_project/features/Auth/register/domain/usecases/register.dart';
import 'package:mega_trust_project/features/Auth/register/presentation/bloc/register_states.dart';
@injectable
class RegisterCubit extends Cubit <RegisterState>{
  RegisterCubit(this._register) : super(RegisterState.initial());
  final Register _register;
  static RegisterCubit get(context)=>BlocProvider.of(context) ;

  Future<void> register({
   required String name,
   required String password,
   required String confirmPassword,
   required String email,


})async {
    emit(RegisterState.loading());
    final registerData= RegisterationInputEntities(
        email: email,
        name: name,
        password: password,
        passwordConfirmation: confirmPassword);
    final result= await _register(registerData);
    emit(result.fold((failure) {
      return RegisterState.error(errorMessage: failure.e);

    }, (user) {
      print( 'user: $user');
      return RegisterState.success();
    }));

  }


}