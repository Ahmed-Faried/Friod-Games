import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Game1(2024)/home.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '2048',
      theme: ThemeData(

          primarySwatch: Colors.blue,
          fontFamily: 'StarJedi'
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}


