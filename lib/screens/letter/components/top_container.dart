import 'package:flutter/material.dart';
import 'package:lighthouse/utilities/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lighthouse/utilities/fonts.dart';

class TopContainer extends StatelessWidget {
  final String text;
  final String btnText;
  final Image image;
  final Color btnTextColor;
  final Color backgroundColor;

  TopContainer({
    this.backgroundColor,
    this.text,
    this.btnText,
    this.image,
    this.btnTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(312),
      height: ScreenUtil().setHeight(119),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: new BorderRadius.all(const Radius.circular(15.0)),
      ),
      padding: EdgeInsets.symmetric(
        vertical: ScreenUtil().setHeight(13),
        horizontal: ScreenUtil().setWidth(19),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontFamily: notoSans,
                  fontSize: ScreenUtil().setSp(14)
                ),
              ),
              ElevatedButton(
                onPressed: (){},
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(const Radius.circular(10.0))),
                  elevation: 0,
                  minimumSize: Size(ScreenUtil().setWidth(163), ScreenUtil().setHeight(39)),
                ),
                child: Text(
                    btnText,
                    style: TextStyle(
                    color: btnTextColor,
                    fontWeight: FontWeight.bold,
                    fontFamily: notoSans,
                    fontSize: ScreenUtil().setSp(13)
                ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(right: ScreenUtil().setWidth(4.5)),
            child: image,
          ),
        ],
      ),
    );
  }
}
