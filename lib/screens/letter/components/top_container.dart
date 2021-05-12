import 'package:flutter/material.dart';
import 'package:lighthouse/utilities/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lighthouse/utilities/fonts.dart';

class TopContainer extends StatelessWidget {
  int count;

  TopContainer({
    this.count,
  });

  Widget _getContainer(String text, String btnText, Image image, Color btnTextColor, Color backgroundColor){
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


  @override
  Widget build(BuildContext context) {
    if(count > 0){
      return _getContainer(
        "다른 고민이 있다면\n언제든지 털어놓아보세요.",
        "새 편지 쓰러 가기",
        Image.asset(
          "assets/images/airplane.png",
          width: ScreenUtil().setWidth(72),
        ),
        primaryColor,
        primaryLightColor,
      );
    }else if(count == 0){
      return _getContainer(
        "우표를 다 썼네요.\n우표 충전 후 편지를 써보세요!",
        "우표 무료 충전하기",
        Image.asset(
          "assets/images/stamp_red.png",
          width: ScreenUtil().setWidth(72),
        ),
        const Color(0xffff5050),
        const Color(0xffffe8e8),
      );
    }
  }
}
