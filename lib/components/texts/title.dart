import 'package:flutter/material.dart';
import 'package:lighthouse/utilities/fonts.dart';
import 'package:lighthouse/utilities/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpTitle extends StatelessWidget {
  final String title, subTitle;
  Color titleColor = Color(0xff1b1b1b);

  SignUpTitle({
    Key key,
    @required this.title,
    this.titleColor,
    this.subTitle,
  }) : super(key: key);

  Padding getPadding(){
    if(subTitle == null){
      return Padding(
        padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(30)),
      );
    }else{
      return Padding(
        padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(10)),
        child: SizedBox(
          width: double.infinity,
          child: Text(
            subTitle,
            style: TextStyle(
                color: const Color(0xff999999),
                fontFamily: notoSans,
                fontSize: ScreenUtil().setSp(12)),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: ScreenUtil().setHeight(70)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(10)),
            child: SizedBox(
              width: double.infinity,
              child: Text(
                title,
                style: TextStyle(
                    color: titleColor,
                    fontWeight: FontWeight.bold,
                    fontFamily: notoSans,
                    fontSize: ScreenUtil().setSp(24)),
              ),
            ),
          ),
          getPadding(),
        ],
      ),
    );
  }
}
