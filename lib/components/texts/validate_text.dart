import 'package:flutter/material.dart';
import 'package:lighthouse/utilities/colors.dart';
import 'package:lighthouse/utilities/fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lighthouse/utilities/variables.dart';

class ValidateText extends StatelessWidget {
  final String label;
  final bool validateState;

  const ValidateText({
    Key key,
    this.label,
    this.validateState,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
        label,
        style: TextStyle(
          color:  validateState?primaryColor:errorColor,
          fontFamily: notoSans,
          fontSize: ScreenUtil().setSp(12)
        ),
    );
  }
}

