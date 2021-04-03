import 'package:flutter/material.dart';
import 'package:lighthouse/components/gradeinfo_button.dart';
import 'package:lighthouse/components/signup_button.dart';
import 'package:lighthouse/screens/signup/components/signup_title.dart';
import 'package:lighthouse/utilities/constants.dart';
import 'package:lighthouse/utilities/styles.dart';

class Finish extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox.expand(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: [
                SignUpTitle(
                  title: "축하해요!\n가입이 완료되었습니다.",
                  myStyle: signUpSubTitleStyle,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        width: 170,
                        height: 170,
                        decoration:
                            BoxDecoration(color: const Color(0xfff1f1f1))),
                    Padding(
                      padding: const EdgeInsets.only(top: 23),
                      child: Text.rich(
                        TextSpan(
                          text: "등대지기",
                          style: signUpGradeTextStyle,
                          children: <TextSpan>[
                            TextSpan(
                              text: " 등급으로 시작합니다",
                              style: signUpMidTitleTextStyle,
                            ),
                          ],
                        ),
                      ),
                    ),
                    GradeInfoButton(),
                  ],
                ),
              ],
            ),
            SizedBox(
              width: size.width * 1 - buttonPadding * 2,
              child: Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 33),
                child: SignUpButton(
                  text: "확인",
                  onPressed: () {},
                ),
              ),
            ),
          ]),
    );
  }
}
