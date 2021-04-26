import 'package:flutter/material.dart';
import 'package:lighthouse/utilities/colors.dart';
import 'package:lighthouse/utilities/fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WarningAlertDialog extends StatelessWidget {
  final String title, content;
  final Function cancelOnPressed, okOnPressed;
  bool isCheckboxNecessary = true;

  WarningAlertDialog({
    Key key,
    @required this.title,
    @required this.content,
    this.cancelOnPressed,
    this.okOnPressed,
    this.isCheckboxNecessary,
  }) : super(key: key);

  Widget _getCheckbox(){
    return Container(
      child: Row(
        children: [
          Checkbox(
              value: false,
              onChanged: (bool value){}
          ),
          Text(
            "다시 보지 않음",
            style: TextStyle(
              color:  Colors.white,
              fontWeight: FontWeight.w500,
              fontFamily: notoSans,
              fontSize: ScreenUtil().setSp(12),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: Column(
          children: [
            Image.asset(
              "assets/images/lighthouse_alert.png",
              width: ScreenUtil().setWidth(36),
            ),
            Text(
              "너ㅏ리너ㅣㅏㄹ이ㅏ너",
              style: TextStyle(
                color:  Colors.black,
                fontWeight: FontWeight.w700,
                fontFamily: notoSans,
                fontSize: ScreenUtil().setSp(16),
              ),
            ),
          ],
        ),
      ),
      content: Text(
        content,
        style: TextStyle(
          color: const Color(0xff666666),
          fontWeight: FontWeight.w400,
          fontFamily: notoSans,
          fontSize: ScreenUtil().setSp(14),
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text(
            "취소",
            style: TextStyle(
                color: const Color(0xff777777),
                fontWeight: FontWeight.w500,
                fontFamily: notoSans,
                fontSize: ScreenUtil().setSp(16)
            ),
          ),
          onPressed: cancelOnPressed,
        ),
        TextButton(
          child: Text(
            "예",
            style: TextStyle(
                color:  primaryColor,
                fontWeight: FontWeight.w500,
                fontFamily: notoSans,
                fontSize: ScreenUtil().setSp(16)
            ),
          ),
          onPressed: okOnPressed,
        ),
      ],
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
      ),
    );
  }
}