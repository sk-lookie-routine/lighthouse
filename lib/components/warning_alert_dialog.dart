import 'package:flutter/material.dart';
import 'package:lighthouse/utilities/colors.dart';
import 'package:lighthouse/utilities/fonts.dart';

class WarningAlertDialog extends StatelessWidget {
  final String title, content;
  final Function cancelOnPressed, okOnPressed;

  const WarningAlertDialog({
    Key key,
    @required this.title,
    @required this.content,
    this.cancelOnPressed,
    this.okOnPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: Column(
          children: [
            Image.asset(
              "assets/images/lighthouse_alert.png",
              width: 38,
            ),
            Text(
                title,
                style: const TextStyle(
                    color:  Colors.black,
                    fontWeight: FontWeight.w700,
                    fontFamily: notoSans,
                    fontStyle:  FontStyle.normal,
                    fontSize: 16.0
                ),
                textAlign: TextAlign.left
            ),
          ],
        ),
      ),
      content: Text(
          content,
          style: const TextStyle(
          color: const Color(0xff666666),
            fontWeight: FontWeight.w400,
            fontFamily: notoSans,
            fontStyle:  FontStyle.normal,
            fontSize: 14.0
        ),
        textAlign: TextAlign.left
      ),
      actions: <Widget>[
        TextButton(
          child: Text(
              "취소",
              style: const TextStyle(
                  color: const Color(0xff777777),
                  fontWeight: FontWeight.w500,
                  fontFamily: notoSans,
                  fontStyle:  FontStyle.normal,
                  fontSize: 16.0
              ),
              textAlign: TextAlign.left
          ),
          onPressed: cancelOnPressed,
        ),
        TextButton(
          child: Text(
              "예",
              style: const TextStyle(
                  color:  primaryColor,
                  fontWeight: FontWeight.w500,
                  fontFamily: notoSans,
                  fontStyle:  FontStyle.normal,
                  fontSize: 16.0
              ),
              textAlign: TextAlign.left
          ),
          onPressed: okOnPressed,
        ),
      ],
    );
  }
}