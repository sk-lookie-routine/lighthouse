import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lighthouse/screens/signup/components/sign_up_nickname.dart';

class SignUpMoreInfo extends StatefulWidget {
  _SignUpMoreInfoState createState() => _SignUpMoreInfoState();
}

class _SignUpMoreInfoState extends State<SignUpMoreInfo> {
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
                      builder: (context) => SignUpNickName(),
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
