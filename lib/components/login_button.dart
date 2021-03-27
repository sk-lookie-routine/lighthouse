import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Color color, textColor;
  final Image iconImage;

  const LoginButton({
    Key key,
    @required this.text,
    @required this.onPressed,
    @required this.color,
    @required this.iconImage,
    @required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: iconImage,
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
      label: Text(
        text,
        style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            fontSize: 14.0),
        textAlign: TextAlign.center,
      ),
    );
  }
}
