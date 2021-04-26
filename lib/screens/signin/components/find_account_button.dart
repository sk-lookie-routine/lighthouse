import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lighthouse/utilities/colors.dart';
import 'package:lighthouse/utilities/fonts.dart';

class FindAccountButton extends StatelessWidget {
  final IconData iconData;
  final String text;
  final Function onPressed;

  FindAccountButton({
    Key key,
    this.text,
    this.iconData,
    this.onPressed,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      label: Text(
          text,
        style: TextStyle(
          color:  const Color(0xff161616),
          fontWeight: FontWeight.w400,
          fontFamily: notoSans,
          fontSize: ScreenUtil().setSp(12),
        ),
      ),
      icon: Icon(
          iconData,
        size: ScreenUtil().setWidth(14),
        color: primaryColor,
      ),
      onPressed: onPressed,
    );
  }
}
