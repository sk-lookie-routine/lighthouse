import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lighthouse/utilities/colors.dart';
import 'package:lighthouse/utilities/fonts.dart';

class SignUpButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  const SignUpButton({
    Key key,
    @required this.text,
    @required this.onPressed,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(
            color:  Colors.white,
            fontWeight: FontWeight.w400,
            fontFamily: notoSans,
            fontStyle:  FontStyle.normal,
            fontSize: 20.0
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
