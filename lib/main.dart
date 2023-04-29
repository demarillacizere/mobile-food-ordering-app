import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_app/register.dart';
import 'package:food_app/login.dart';
import 'package:food_app/screens/home/landing.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color(0xFFFFF7DD),
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chap Chap Delivery',
      theme: ThemeData(
          // primarySwatch: Color(0xFFfff7dd),
          ),
      home: const LandingPage(),
    );
  }
}


