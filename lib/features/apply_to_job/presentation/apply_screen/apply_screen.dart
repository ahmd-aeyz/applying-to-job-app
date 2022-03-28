import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_trust_project/features/apply_to_job/presentation/bloc/apply_cubit.dart';
import 'package:mega_trust_project/features/apply_to_job/presentation/widgets/widget.dart';

import '../bloc/apply_states.dart';

class ApplyToJob extends StatelessWidget {
  const ApplyToJob({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (BuildContext context)=>ApplyCubit(),
      child: BlocConsumer<ApplyCubit, ApplyStates>(
        listener: (context, state) {},
        builder: (context, state){
          return  Scaffold(
            appBar: AppBar(
              title:Text(' Applying To The Job'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        label: Text('Name'),

                      ),

                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        label: Text('Email'),

                      ),

                    ),
                    SizedBox(height:5),
                    TextFormField(
                      decoration: InputDecoration(
                        label: Text('Skills'),

                      ),

                    ),
                    SizedBox(height:5),
                    TextFormField(
                      decoration: InputDecoration(
                        label: Text('Phone Number'),

                      ),

                    ),
                    SizedBox(height:30),

                    Container(
                      child: ElevatedButton(onPressed: (){},
                        child: Text('Apply'),

                      ),
                      width: 100,
                      height: 50,
                    )
                  ],
                ),
              ),
            ),


          );
        },

      ),
      );






  }
}
