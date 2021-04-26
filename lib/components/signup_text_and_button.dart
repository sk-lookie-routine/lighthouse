import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lighthouse/screens/signup/signup_screen.dart';
import 'package:lighthouse/utilities/fonts.dart';

class SignUpTextAndButton extends StatelessWidget {
  final BuildContext context;

  SignUpTextAndButton({
    Key key,
    @required this.context,
}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(57)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: ScreenUtil().setWidth(20)),
            child: Text(
              "아직 회원이 아니신가요?",
              style: TextStyle(
                color:  Colors.white,
                fontFamily: notoSans,
                fontSize: ScreenUtil().setSp(12),
              ),
            ),
          ),
          TextButton(
            onPressed: (){
              Navigator.pushNamed(
                  context,
                  SignUpScreen.id);
            },
            child: Text(
              "회원가입",
              style: TextStyle(
                color:  const Color(0xff5230ce),
                fontWeight: FontWeight.bold,
                fontFamily: notoSans,
                fontSize: ScreenUtil().setSp(12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
