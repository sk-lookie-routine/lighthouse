import 'package:flutter/cupertino.dart';
import 'package:lighthouse/screens/signup/sign_up_moreinfo_screen.dart';
import 'package:lighthouse/screens/signup/sign_up_nickname_screen.dart';
import 'package:lighthouse/screens/welcome/welcome_screen.dart';

final routes = {
  WelcomeScreen.id: (BuildContext context) => WelcomeScreen(),
  SignUpNickNameScreen.id: (BuildContext context) => SignUpNickNameScreen(),
  SignUpMoreInfoScreen.id: (BuildContext context) => SignUpMoreInfoScreen(),
};
