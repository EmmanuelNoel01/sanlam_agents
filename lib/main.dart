// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:sanlam_agents/screens/settings.dart';

import 'screens/bottomnavigationbar.dart';
import 'screens/home.dart';
import 'screens/login.dart';
import 'screens/otp.dart';



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
        home: BottomNavBar());
  }
}
