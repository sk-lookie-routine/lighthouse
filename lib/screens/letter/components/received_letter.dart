import 'package:flutter/material.dart';
import 'package:lighthouse/utilities/colors.dart';
import 'package:lighthouse/utilities/fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lighthouse/utilities/variables.dart';

class ReceivedLetter extends StatelessWidget {
  final String nickname;
  final Level level;
  final List<String> keywords;
  final String date;
  final Function onPressed;
  final bool isRead;

  ReceivedLetter({
    this.nickname,
    this.level,
    this.keywords,
    this.date,
    this.onPressed,
    this.isRead,
  });

  Color _getLevelTextColor(Level level){
    if(level == Level.gold) return goldColor;
    else if(level == Level.silver) return silverColor;
    else if(level == Level.bronze) return bronzeColor;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          "assets/images/letter_new.png",
          width: ScreenUtil().setWidth(38),
        ),
        Container(
          width: ScreenUtil().setWidth(261),
          height: ScreenUtil().setHeight(80),
          color: primaryMoreLightColor,
          padding: EdgeInsets.symmetric(
            vertical: ScreenUtil().setHeight(13),
            horizontal: ScreenUtil().setWidth(14),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text.rich(
                    TextSpan(
                      text: nickname,
                      style: TextStyle(
                          color: Color(0xff575757),
                          fontWeight: FontWeight.bold,
                          fontFamily: notoSans,
                          fontSize: ScreenUtil().setSp(14)),
                      children: <TextSpan>[
                        TextSpan(
                          text: " 등급으로 시작합니다",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontFamily: notoSans,
                              fontSize: ScreenUtil().setSp(14),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(),
            ],
          ),
        ),
      ],
    );
  }
}
