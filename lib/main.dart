import 'package:flutter/material.dart';
import 'package:lighthouse/utilities//colors.dart';
import 'package:lighthouse/utilities/fonts.dart';
import 'package:lighthouse/app.dart';
import 'package:lighthouse/utilities/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Light House',
      theme: ThemeData(
        fontFamily: notoSans,
        primaryColor: primaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: App(),
      routes: routes,
    );
  }
}
