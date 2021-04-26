import 'package:flutter/material.dart';
import 'package:lighthouse/utilities/fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GradeInfoTextButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (){},
      child: Text(
          "Light house 등급제 알아보기",
        style: TextStyle(
            color:  const Color(0xff999999),
            fontFamily: notoSans,
            fontSize: ScreenUtil().setSp(10),
            decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
