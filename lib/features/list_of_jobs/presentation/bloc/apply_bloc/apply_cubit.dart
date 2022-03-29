import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:mega_trust_project/features/list_of_jobs/domain/usecases/apply_usecase.dart';

import 'apply_states.dart';
@injectable
class ApplyCubit extends Cubit<ApplyState> {
  final ApplyJob _applyJob;
  int jobId =-1;

  ApplyCubit(this._applyJob) : super(ApplyState.initial());

  Future<void> applyJob({required int jobId}) async {
    this.jobId= jobId;
    emit(ApplyState.loading());
    final result = await _applyJob(jobId);
    result.fold(
      (error) => emit(ApplyState.error()),
      (success) => emit(ApplyState.success()),
    );
  }
}
