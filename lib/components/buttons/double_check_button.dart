import 'package:flutter/material.dart';
import 'package:lighthouse/utilities/colors.dart';
import 'package:lighthouse/utilities/fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoubleCheckButton extends StatelessWidget {
  final Function onPressed;

  const DoubleCheckButton({
    Key key,
    this.onPressed
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: primaryLightColor,
          elevation: 0,
          minimumSize: Size(ScreenUtil().setWidth(82), ScreenUtil().setWidth(44)),
        ),
        child: Text(
          "중복확인",
          style: TextStyle(
              color:  primaryColor,
              fontWeight: FontWeight.w500,
              fontFamily: notoSans,
              fontSize: ScreenUtil().setSp(14)
          ),
        ),
    );
  }
}
