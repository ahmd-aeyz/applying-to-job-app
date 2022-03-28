import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_trust_project/core/assets/icons.dart';
import 'package:mega_trust_project/features/Auth/login/presentation/bloc/login_cubit.dart';
import 'package:mega_trust_project/features/Auth/login/presentation/bloc/login_states.dart';
import 'package:mega_trust_project/features/Auth/login/presentation/widgets/widgets.dart';
import 'package:mega_trust_project/features/Auth/register/presentation/screens/register.dart';


class LoginScreen extends StatelessWidget {

  var emailController= TextEditingController();

  var passwordController= TextEditingController();

  var formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (BuildContext context)=>LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
          listener: (context, state){},
        builder:(context, state) {

          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Text('Hellow Again !',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrange,
                        ),

                      ),
                      SizedBox(
                        height: 5,),
                      Text('Welcomeback you have been missed',
                        style: TextStyle(
                          fontSize: 20,
                        ),

                      ),
                      SizedBox(
                        height: 25,),
                      defaultFormField(
                          controller: emailController,

                          keyboardType: TextInputType.text,

                          validate: (String ?value) {
                            if (value!.isEmpty) {
                              return 'Email can not be empty';
                            }
                            return null;
                          },
                          prefixIcon: lockPassword,
                          label: 'Email'),
                      SizedBox(
                        height: 15,),

                      defaultFormField(
                          controller: passwordController,
                          keyboardType: TextInputType.text,
                          validate: (String ?value) {
                            if (value!.isEmpty) {
                              return 'Password can not be empty';
                            }
                            return null;
                          },
                          prefixIcon: emailIcon,
                          label: 'Password'),

                      SizedBox(
                        height: 25,),
                       customButton(
                            onPressed: () {}, text: "LOGIN"),

                      SizedBox(
                        height: 10,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegisterScreen()));
                          },
                          child: Text('Register Here')),


                    ],
                  ),
                ),
              ),
            ),
          );
        }
      ),

      );


  }
}

