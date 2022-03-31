import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:mega_trust_project/features/list_of_jobs/domain/usecases/job_usecase.dart';
import 'package:mega_trust_project/features/list_of_jobs/presentation/bloc/job_states.dart';

@injectable
class JobCubit extends Cubit<JobStates> {
  final JobsUsercase jobsUsecase;

  JobCubit(this.jobsUsecase) : super(JobInitialStates());


  Future<void> getJobList() async {
    print('job cubit');
    emit(JobLoadingStates());
     var result = await jobsUsecase.call();
    emit(result.fold((failure) {
      return JobErrorStates(failure.e);
    }, (list) {
      print( 'list in cubit $list');
      return JobSuccessStates(data: list);
    }));
  }

}
