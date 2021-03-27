import 'package:flutter/material.dart';
import 'package:lighthouse/components/login_button.dart';
import 'package:lighthouse/utilities/constants.dart';
import 'package:lighthouse/utilities/colors.dart';
import 'package:lighthouse/screens/welcome/components/background.dart';
import 'package:lighthouse/services/login.dart';

class Body extends StatelessWidget {
  final double padding = 17;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; //화면의 가로와 세로 길이
    return Background(
      child: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(
              "로그인",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 24.0),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: getHeightByScreenSize(size.height, 11),
            ),
            Text(
              "sns 아이디로 간편하게 로그인하고\n입시 고민을 해결해 보세요!",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 12.0),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: getHeightByScreenSize(size.height, 14),
            ),
            SizedBox(
              width: size.width * 1 - padding * 2,
              child: LoginButton(
                onPressed: signInWithKaKao,
                iconImage: Image.asset(
                  "assets/icons/icon_kakao.png",
                  width: 18,
                ),
                text: "카카오 로그인",
                textColor: kakaoSecondaryColor,
                color: kakaoPrimaryColor,
              ),
            ),
            SizedBox(
              height: getHeightByScreenSize(size.height, 14),
            ),
            SizedBox(
              width: size.width * 1 - padding * 2,
              child: LoginButton(
                onPressed: signInWithGoogle,
                iconImage: Image.asset(
                  "assets/icons/icon_google.png",
                  width: 18,
                ),
                text: "Google 계정으로 로그인",
                textColor: Colors.black,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: getHeightByScreenSize(size.height, 94),
            ),
          ],
        ),
      ),
    );
  }
}
