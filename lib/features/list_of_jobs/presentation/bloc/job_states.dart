import 'package:mega_trust_project/core/error/failures.dart';
import 'package:mega_trust_project/features/list_of_jobs/data/model/job_data_model.dart';

import '../../domain/entities/job_entities.dart';

abstract class JobStates{}
class JobInitialStates extends JobStates{}
class JobLoadingStates extends JobStates{}
class JobSuccessStates extends JobStates{

  final List<JobData> data;
  JobSuccessStates({required this.data});

}
class JobErrorStates extends JobStates{

  final String e;

  JobErrorStates(this.e);

}
