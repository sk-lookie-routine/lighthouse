import 'package:flutter/material.dart';
import 'package:lighthouse/screens/signup/components/sign_up_moreinfo.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //빅 타이틀 -> 서영님
            SignUpMoreInfo(),
            //서브 타이틀
            //사이에 내용
            //보라버튼
          ]),
    );
  }
}
