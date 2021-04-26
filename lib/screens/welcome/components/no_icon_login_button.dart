import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoIconLoginButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Color color, textColor;

  const NoIconLoginButton({
    Key key,
    @required this.text,
    @required this.onPressed,
    @required this.color,
    @required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            primary: color,
            elevation: 4.0,
            padding: EdgeInsets.symmetric(
              vertical: 15,
            ),
            shape: new RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            text,
            style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.w500,
            fontSize: ScreenUtil().setSp(14)),
          textAlign: TextAlign.center,
        ),
    );
  }
}
