import 'package:flutter/material.dart';
import 'package:lighthouse/utilities/fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoLetterInform extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/bird_sad.png",
          width: ScreenUtil().setWidth(125),
        ),
        Text(
          "편지 보관함이 비어있어요...",
          style: TextStyle(
              color: Color(0xffb2b2b2),
              fontFamily: notoSans,
              fontSize: ScreenUtil().setSp(14)
          ),
        ),
      ],
    );
  }
}
