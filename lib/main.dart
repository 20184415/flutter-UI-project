import 'package:flutter/material.dart';
import 'package:test1/MyhomePage.dart';
import 'Stopwatchpage.dart';
import 'Date.dart';
import 'Page1.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        //  scaffoldBackgroundColor: Colors.black,
       colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      home:MyHomePage(),
      // MyHomePage(),
      //Stopwatchpage(),
    );
  }
}