

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_trust_project/features/apply_to_job/presentation/bloc/apply_states.dart';

class ApplyCubit extends Cubit<ApplyStates>{
  ApplyCubit() : super(ApplyInitialState());

}