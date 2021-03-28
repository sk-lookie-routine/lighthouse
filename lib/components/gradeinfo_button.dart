import 'package:flutter/material.dart';
import 'package:lighthouse/utilities/fonts.dart';

class GradeInfoButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (){},
      style: TextButton.styleFrom(
      ),
      child: Text(
          "Light house 등급제 알아보기",
        style: TextStyle(
            color:  const Color(0xff999999),
            fontWeight: FontWeight.w400,
            fontFamily: notoSans,
            fontStyle:  FontStyle.normal,
            fontSize: 10.0,
            decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
