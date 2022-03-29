

import 'package:dartz/dartz.dart';
import 'package:mega_trust_project/core/error/failures.dart';
import 'package:mega_trust_project/core/usecase/usecase.dart';
import 'package:mega_trust_project/features/list_of_jobs/domain/repository/job_rep.dart';

class ApplyJob extends UseCase<String,int > {
  final JobDataRepository _jobDataRepository;
  ApplyJob(this._jobDataRepository);
  @override
  Future<Either<Failure, String>> call(int params) async {
    return await _jobDataRepository.applyJob(jobId: params);
  }

}