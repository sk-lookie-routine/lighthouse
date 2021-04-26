import 'package:flutter/material.dart';
import 'package:lighthouse/components/dialogs/warning_alert_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lighthouse/utilities/colors.dart';

void showAlertDialog(BuildContext context, String title, String content, Function cancelOnPressed, Function okOnPressed) async {
  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return  Card(
        color: Colors.transparent,
        elevation: 0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AlertDialog(
              title: Center(
                child: Column(
                  children: [
                    Image.asset(
                      "assets/images/lighthouse_alert.png",
                      width: ScreenUtil().setWidth(36),
                    ),
                    Text(
                      title,
                      style: TextStyle(
                        color:  Colors.black,
                        fontWeight: FontWeight.w700,
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
                        fontSize: ScreenUtil().setSp(16)
                    ),
                  ),
                  onPressed: okOnPressed,
                ),
              ],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
              ),
              contentPadding: EdgeInsets.fromLTRB(21,16,21,20),
              insetPadding: EdgeInsets.only(bottom: ScreenUtil().setWidth(2)),
            ),
            Padding(
              padding: EdgeInsets.only(left: ScreenUtil().setWidth(46)),
              child: Row(
                children: [
                  Theme(
                    data: ThemeData(
                        unselectedWidgetColor: Colors.white
                    ),
                    child: Checkbox(
                        value: true,
                        checkColor: Colors.black54,
                        activeColor: Colors.white,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        onChanged: (bool value){}
                    ),
                  ),
                  Text(
                    "다시 보지 않음",
                    style: TextStyle(
                      color:  Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: ScreenUtil().setSp(12),
                    ),
                  )
                ],
              ),
            ),

          ],
        ),
      );
    },
  );
}