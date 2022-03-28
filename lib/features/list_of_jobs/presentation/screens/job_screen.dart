import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_trust_project/features/list_of_jobs/domain/entities/job_entities.dart';
import 'package:mega_trust_project/features/list_of_jobs/presentation/bloc/job_cubit.dart';
import 'package:mega_trust_project/features/list_of_jobs/presentation/bloc/job_states.dart';
import 'package:mega_trust_project/features/list_of_jobs/presentation/widget/widgets.dart';

import '../../../../locator.dart';


class JobScreen extends StatelessWidget {


  const JobScreen({Key? key}) : super(key: key);




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          title: Center(child: Text("Jobs")),
        ),
        body:BuildBlocWidget());
  }



  }

class BuildListView extends StatelessWidget {
  const BuildListView ({Key? key, required this.allJobs}) : super(key: key) ;
    final List <JobData> allJobs;

    @override
    Widget build(BuildContext context) {
      return ListView.builder(
          itemCount:allJobs.length,
          itemBuilder: (BuildContext context, index) {
            return JobListBuilder(Job:allJobs[index] );
          });
    }
  }




class BuildBlocWidget extends StatelessWidget {
  const BuildBlocWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (BuildContext context)=>getIt<JobCubit>(),
      child: BlocConsumer<JobCubit, JobStates>(
          listener: (context, state) {

          },
          builder: (context, state) {

            print("state is nnn : $state");
            if (state is JobInitialStates) {
              context.read<JobCubit>().getJobList();
            }

            if (state is JobSuccessStates){
              final List<JobData> allJobs= (state).data;
              print(allJobs);

              return BuildListView(allJobs: allJobs);
              //return buildLoadedListWidgets();
            }
            else{
              print("state is builder : $state");

              return Center(
                child: Container(
                  child: CircularProgressIndicator(),

                ),
              );
            }
          }




      ),

    );;
  }
}
