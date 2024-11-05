import 'package:flutter/material.dart';
import 'package:sanlam_agents/splash.dart';

import 'screens/login.dart';
import 'screens/otp.dart';
import 'screens/signup.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: OTPPage());
  }
}
