import 'package:flutter/material.dart';
import 'package:lighthouse/screens/welcome/components/body.dart';

class WelcomeScreen extends StatelessWidget {
  static const String id = 'welcome_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}