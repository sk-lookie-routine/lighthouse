import 'package:flutter/cupertino.dart';
import 'package:lighthouse/screens/signup/sign_up_moreinfo_screen.dart';
import 'package:lighthouse/screens/signup/sign_up_nickname_screen.dart';
import 'package:lighthouse/screens/welcome/welcome_screen.dart';

final routes = {
  '/': (BuildContext context) => WelcomeScreen(),
  '/signup_nickname': (BuildContext context) => SignUpNickName(),
  '/signup_moreinfo': (BuildContext context) => SignUpMoreInfo(),
};