import 'package:flutter/material.dart';
import 'package:lighthouse/utilities/colors.dart';
import 'package:lighthouse/utilities/fonts.dart';

class WarningAlertDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
          "주의",
          style: const TextStyle(
              color:  Colors.black,
              fontWeight: FontWeight.w700,
              fontFamily: notoSans,
              fontStyle:  FontStyle.normal,
              fontSize: 20.0
          ),
          textAlign: TextAlign.left
      ),
      content: Text(
          "추가정보를 모두 입력하지 않으면 서비스 이용에 제한이 있습니다.",
          style: const TextStyle(
          color:  const Color(0xff686868),
            fontWeight: FontWeight.w400,
            fontFamily: notoSans,
            fontStyle:  FontStyle.normal,
            fontSize: 16.0
        ),
        textAlign: TextAlign.left
      ),
      actions: <Widget>[
        TextButton(
          child: Text(
              "취소",
              style: const TextStyle(
                  color:  Colors.black,
                  fontWeight: FontWeight.w500,
                  fontFamily: notoSans,
                  fontStyle:  FontStyle.normal,
                  fontSize: 18.0
              ),
              textAlign: TextAlign.left
          ),
          onPressed: () {
            Navigator.pop(context, "cancel");
          },
        ),
        TextButton(
          child: Text(
              "예",
              style: const TextStyle(
                  color:  primaryColor,
                  fontWeight: FontWeight.w500,
                  fontFamily: notoSans,
                  fontStyle:  FontStyle.normal,
                  fontSize: 18.0
              ),
              textAlign: TextAlign.left
          ),
          onPressed: () {
            Navigator.pop(context, "ok");
          },
        ),
      ],
    );
  }
}