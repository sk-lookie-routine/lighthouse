import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Color backgroundColor;

  const SignUpButton({
    Key key,
    @required this.text,
    @required this.onPressed,
    @required this.backgroundColor,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed, //관심키워드 선택 페이지 이동
      child: Text(
        text,
        style: TextStyle(
          color: const Color(0xffffffff),
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0))),
    );
  }
}
