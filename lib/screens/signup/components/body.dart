import 'package:flutter/material.dart';
import 'package:lighthouse/components/signup_button.dart';
import 'package:lighthouse/screens/signup/components/finish.dart';
import 'package:lighthouse/screens/signup/components/sign_up_moreinfo.dart';
import 'package:lighthouse/screens/signup/components/nickname.dart';
import 'package:lighthouse/utilities/colors.dart';
import 'package:lighthouse/utilities/constants.dart';
import 'package:lighthouse/utilities/styles.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Finish(),
    );
  }
}