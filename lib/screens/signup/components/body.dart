import 'package:flutter/material.dart';
import 'package:lighthouse/screens/signup/components/sign_up_moreinfo.dart';

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
      child: SignUpMoreInfo(),
    );
  }
}
