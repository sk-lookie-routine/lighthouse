import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lighthouse/utilities/colors.dart';
import 'package:lighthouse/utilities/fonts.dart';

class StampCountButton extends StatelessWidget {
  final int count;
  final Function onPressed;

  StampCountButton({
    this.count,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(66),
      height: ScreenUtil().setHeight(33),
      child: ElevatedButton(
        onPressed: (){},
        style: ElevatedButton.styleFrom(
          primary: grayBackgroundColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(const Radius.circular(20.0))),
          elevation: 0,
          padding: EdgeInsets.symmetric(
            vertical: ScreenUtil().setHeight(6),
            horizontal: ScreenUtil().setWidth(13),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/stamp.png",
              width: ScreenUtil().setWidth(21),
            ),
            Text(
              count.toString(),
              style: TextStyle(
                  color: const Color(0xff535353),
                  fontWeight: FontWeight.w500,
                  fontFamily: notoSans,
                  fontSize: ScreenUtil().setSp(14)
              ),
            ),
          ],
        ),
      ),
    );
  }
}
