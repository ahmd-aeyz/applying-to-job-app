import 'package:flutter/material.dart';
import 'package:mega_trust_project/features/Auth/register/presentation/screens/register.dart';
import 'package:mega_trust_project/locator.dart';

import 'features/Auth/login/presentation/screens/LoginScreen.dart';

void main() async {
  await initLocator();
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.deepOrange,
      ),
      home: LoginScreen(),
    );
  }
}
