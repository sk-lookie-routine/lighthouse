import 'package:flutter/material.dart';
import 'package:lighthouse/utilities/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lighthouse/utilities/fonts.dart';

class SquaredLetterKeyword extends StatelessWidget {
  final String text;

  SquaredLetterKeyword(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: primaryLightColor,
        borderRadius: new BorderRadius.all(const Radius.circular(5.0)),
      ),
      padding: EdgeInsets.symmetric(
        vertical: ScreenUtil().setHeight(5),
        horizontal: ScreenUtil().setWidth(8),
      ),
      child: Text(
        text,
        style: TextStyle(
            color: primaryColor,
            fontFamily: notoSans,
            fontSize: ScreenUtil().setSp(10)
        ),
      ),
    );
  }
}
