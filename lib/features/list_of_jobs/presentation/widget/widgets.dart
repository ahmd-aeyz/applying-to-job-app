import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mega_trust_project/features/list_of_jobs/domain/entities/job_entities.dart';



class JobListBuilder extends StatelessWidget {

final JobData  Job;
  const JobListBuilder({Key? key, required this.Job}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Container(
      width: double.infinity,
      child: Column(
        children: [
          Container(
              child: Card(
                color: Colors.white38,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text( Job.title.toString(),
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width:250,
                      ),

                      TextButton(onPressed: (){}, child: Text('Apply Now'))
                    ],
                  ),

                ),

              )
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


