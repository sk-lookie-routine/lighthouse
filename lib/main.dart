import 'package:flutter/material.dart';
import 'package:lighthouse/screens/signup/components/sign_up_nickname.dart';
import 'package:lighthouse/screens/welcome/welcome_screen.dart';
import 'package:lighthouse/utilities//colors.dart';
import 'package:lighthouse/utilities/fonts.dart';
import 'package:lighthouse/app.dart';

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
      home: SignUpNickName(),
    );
  }
}
