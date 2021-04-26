import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IconLoginButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Color color, textColor;
  final Image iconImage;

  const IconLoginButton({
    Key key,
    @required this.text,
    @required this.onPressed,
    @required this.color,
    @required this.textColor,
    this.iconImage,
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
      child: Stack(
        children: <Widget>[
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 29),
                child: iconImage,
              ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              text,
              style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w500,
                  fontSize: ScreenUtil().setSp(14)),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
