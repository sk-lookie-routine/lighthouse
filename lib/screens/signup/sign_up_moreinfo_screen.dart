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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 24),
              ),
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignUpNickNameScreen(),
                    ),
                  );
                },
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
