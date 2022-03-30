import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_trust_project/features/list_of_jobs/domain/entities/job_entities.dart';
import 'package:mega_trust_project/features/list_of_jobs/presentation/bloc/apply_bloc/apply_cubit.dart';
import 'package:mega_trust_project/features/list_of_jobs/presentation/bloc/apply_bloc/apply_states.dart';

class JobListBuilder extends StatelessWidget {
  final JobData job;

  const JobListBuilder({Key? key, required this.job}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Card(
            color: Colors.white38,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        job.title.toString(),
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        job.jobDescription.toString(),
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        job.publishDate.toString(),
                        style: const TextStyle(
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                  BlocConsumer<ApplyCubit, ApplyState>(
                    listener: (context, state) {},
                    buildWhen: (_, __) {
                      return context.read<ApplyCubit>().jobId == job.id;
                    },
                    builder: (context, state) {

                      return state.map(
                          initial: (_) {
                            return TextButton(
                                onPressed: () async {
                                  await BlocProvider.of<ApplyCubit>(context)
                                      .applyJob(jobId: job.id);
                                },
                                child: const Text('Apply Now'));
                          },
                          loading: (_) => const CircularProgressIndicator(),
                          success: (_) {
                            job.isApplied = true;
                            return const Text("Applied");
                          },
                          error: (error) => Text(error.toString()));
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Widget buildJobList(BuildContext context){
//
//   return Container(
//       width: double.infinity,
//       child: Column(
//         children: [
//           Container(
//             child: Card(
//               color: Colors.white38,
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   children: [
//                     Text( 'jobTitle',
//                     style: TextStyle(
//                       fontSize: 10,
//                       fontWeight: FontWeight.bold,
//                     ),
//                     ),
//                   SizedBox(
//                     width:250,
//                   ),
//
//                   TextButton(onPressed: (){}, child: Text('Apply Now'))
//                   ],
//                 ),
//
//               ),
//
//             )
//           ),
//         ],
//       ),
//     );
// }
