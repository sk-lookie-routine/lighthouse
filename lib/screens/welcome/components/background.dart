import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Background extends StatelessWidget {
  final Widget child;

  Background({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; //화면의 가로와 세로 길이
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(
              "assets/images/welcome_background.png",
              width: size.width * 1,
            ),
          ),
          Positioned(
            top: ScreenUtil().setHeight(135),
            left: ScreenUtil().setWidth(36),
            child: Image.asset(
              "assets/images/logo_light.png",
              width: ScreenUtil().setWidth(170),
            ),
          ),
          child,
        ],
      ),
    );
  }
}
