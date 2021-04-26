import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lighthouse/utilities/colors.dart';
import 'package:lighthouse/utilities/fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoundedFinishedButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  const RoundedFinishedButton({
    Key key,
    @required this.text,
    @required this.onPressed,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
            color:  Colors.white,
            fontFamily: notoSans,
            fontSize: ScreenUtil().setSp(16),
        ),
      ),
      style: TextButton.styleFrom(
          backgroundColor: primaryColor,
          padding: EdgeInsets.symmetric(
            vertical: 11,
          ),
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(26.0),
          ),
      ),
    );
  }
}
