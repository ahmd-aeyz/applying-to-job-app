import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_trust_project/features/Auth/presentation/bloc/auth/auth_cubit.dart';
import 'package:mega_trust_project/features/Auth/presentation/bloc/auth/auth_states.dart';
import 'package:mega_trust_project/features/Auth/presentation/screens/LoginScreen.dart';
import 'package:mega_trust_project/features/list_of_jobs/domain/entities/job_entities.dart';
import 'package:mega_trust_project/features/list_of_jobs/presentation/bloc/job_cubit.dart';
import 'package:mega_trust_project/features/list_of_jobs/presentation/bloc/job_states.dart';
import 'package:mega_trust_project/features/list_of_jobs/presentation/screens/job_list_builder.dart';
import '../../../../di/injectable.dart';
import '../bloc/apply_bloc/apply_cubit.dart';

class JobsListScreen extends StatelessWidget {
  const JobsListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          actions: [
            BlocListener<AuthCubit, AuthState>(
                listener: (context, state) {
                  state.maybeWhen(
                      logout: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen())),
                      orElse: () {
                        print(state.toString());
                      });
                },
                child: IconButton(
                    onPressed: () {
                      context.read<AuthCubit>().logout();
                    },
                    icon: const Icon(Icons.logout)))
          ],
          title: const Center(child: Text("Jobs")),
        ),
        body: const JobsList());
  }
}


class JobsList extends StatelessWidget {
  const JobsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<JobCubit, JobStates>(
        listener: (context, state) {},
        builder: (context, state) {
          print("state is nnn : $state");
          if (state is JobInitialStates) {
            context.read<JobCubit>().getJobList();
          }

          if (state is JobSuccessStates) {
            final List<JobData> allJobs = (state).data;
         //   print(allJobs);

            return BlocProvider<ApplyCubit>(
                create: (context) => getIt<ApplyCubit>(),
                child: ListView.builder(
                    itemCount: allJobs.length,
                    itemBuilder: (BuildContext context, index) {
                      return JobListBuilder(job: allJobs[index]);
                    }));

            //return buildLoadedListWidgets();
          } else {
            print("state is builder : $state");

            return const Center(
              child:  const CircularProgressIndicator(),
            );
          }
        });
  }
}
