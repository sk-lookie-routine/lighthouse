import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lighthouse/screens/signup/sign_up_nickname_screen.dart';

class SignUpMoreInfoScreen extends StatefulWidget {
  static const String id = 'sign_up_moreinfo_screen';
  _SignUpMoreInfoScreenState createState() => _SignUpMoreInfoScreenState();
}

class _SignUpMoreInfoScreenState extends State<SignUpMoreInfoScreen> {
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            tooltip: '이전 페이지',
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[],
        ),
      ),
    );
  }
}
