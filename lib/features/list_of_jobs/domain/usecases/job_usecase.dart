import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../entities/job_entities.dart';
import '../repository/job_rep.dart';

@injectable
class JobsUsercase {
  final JobDataRepository jobRepository;

  JobsUsercase(this.jobRepository);

  Future<Either<Failure, List<JobData>>> call() async {
    return await jobRepository.getJob();
  }
}