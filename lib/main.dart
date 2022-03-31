import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_trust_project/features/Auth/presentation/bloc/auth/auth_cubit.dart';
import 'package:mega_trust_project/features/Auth/presentation/screens/auth.dart';
import 'di/injectable.dart';
import 'features/list_of_jobs/presentation/bloc/job_cubit.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => getIt<AuthCubit>(),
        ),
        BlocProvider(
        create: (BuildContext context) => getIt<JobCubit>(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
        ),
        home: const AuthScreen(),
      ),
    );
  }
}
