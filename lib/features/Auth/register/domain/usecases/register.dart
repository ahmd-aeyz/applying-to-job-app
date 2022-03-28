
import 'package:dartz/dartz.dart';
import 'package:mega_trust_project/core/error/failures.dart';
import 'package:mega_trust_project/core/usecase/usecase.dart';
import 'package:mega_trust_project/features/Auth/register/domain/entities/registeration_input_entity.dart';
import 'package:mega_trust_project/features/Auth/register/domain/entities/user_entity.dart';
import 'package:mega_trust_project/features/Auth/register/domain/repository/RegisterDataRepository.dart';

class Register extends UseCase<UserEntities , RegisterationInputEntities>{
  final RegisterDataRepository registerRepository;

  Register(this.registerRepository);
  @override
  Future<Either<Failure, UserEntities>> call(RegisterationInputEntities params) async{

    return await registerRepository.register(params);


  }



// //   final RegisterDataRepository registerRepository;
// //  Register({required this.registerRepository});
// //
// //   Future<Either<Failure, UserEntities>> excute({
// //   required RegisterationInputEntities data,
// //
// // } ) async{
// //     return await registerRepository.register(data);
// }
}