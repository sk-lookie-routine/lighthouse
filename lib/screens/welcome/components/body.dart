import 'package:flutter/material.dart';
import 'package:lighthouse/components/signup_text_and_button.dart';
import 'package:lighthouse/screens/signin/signin_screen.dart';
import 'package:lighthouse/screens/signup/screens/nickname_screen.dart';
import 'package:lighthouse/utilities/colors.dart';
import 'package:lighthouse/screens/welcome/components/background.dart';
import 'package:lighthouse/services/login.dart';
import 'package:lighthouse/utilities/fonts.dart';
import 'icon_login_button.dart';
import 'no_icon_login_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Body extends StatelessWidget {
  final double btnWidth = 326;
  final double btnHeight = 50;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; //화면의 가로와 세로 길이
    return Background(
      child: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            SizedBox(
              width: ScreenUtil().setWidth(btnWidth),
              height: ScreenUtil().setHeight(btnHeight),
              child: NoIconLoginButton(
                onPressed: (){
                  Navigator.pushNamed(
                    context,
                    SignInScreen.id,
                  );
                },
                text: "이메일 로그인",
                textColor: kakaoSecondaryColor,
                color: const Color(0xffebf4ff),
              ),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(14),
            ),
            SizedBox(
              width: ScreenUtil().setWidth(btnWidth),
              height: ScreenUtil().setHeight(btnHeight),
              child: IconLoginButton(
                onPressed: (){
                  Navigator.pushNamed(
                    context,
                    NickNameScreen.id,
                  );
                },
                //onPressed: signInWithKaKao,
                iconImage: Image.asset(
                  "assets/icons/icon_kakao.png",
                  width: ScreenUtil().setWidth(18),
                ),
                text: "카카오 로그인",
                textColor: kakaoSecondaryColor,
                color: kakaoPrimaryColor,
              ),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(14),
            ),
            SizedBox(
              width: ScreenUtil().setWidth(btnWidth),
              height: ScreenUtil().setHeight(btnHeight),
              child: IconLoginButton(
                onPressed: signInWithGoogle,
                iconImage: Image.asset(
                  "assets/icons/icon_google.png",
                  width: ScreenUtil().setWidth(18),
                ),
                text: "Google 계정으로 로그인",
                textColor: Colors.black,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(19),
            ),
            SignUpTextAndButton(context: context),
          ],
        ),
      ),
    );
  }
}
