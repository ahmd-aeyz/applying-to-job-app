

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:mega_trust_project/features/Auth/domain/entitiy/login_user_entity.dart';
import 'package:mega_trust_project/features/Auth/presentation/bloc/login/login_states.dart';

import '../../../domain/usecases/login_usecase.dart';

@injectable
class LoginCubit extends Cubit <LoginState>{
  LoginCubit(this._login) : super(LoginState.initial());
  final Login _login;
  static LoginCubit get(context)=>BlocProvider.of(context) ;

  Future<void> login({
    required String password,
    required String email,


  })async {
    emit(LoginState.loading());
    final registerData= LoginDataEntity(
        email: email,
        password: password,
     );
    final result= await _login(registerData);
    emit(result.fold((failure) {
      return LoginState.error(errorMessage: failure.e);

    }, (user) {
      print( 'user: $user');
      return LoginState.success();
    }));

  }


}

