import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;

  Background({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; //화면의 가로와 세로 길이
    return Stack(
      children: <Widget>[
        Positioned(
          bottom: 0,
          left: 0,
          child: Image.asset(
            "assets/images/signin_background.png",
            width: size.width * 1,
          ),
        ),
        child,
      ],
    );
  }
}
