import 'package:flutter/material.dart';
import 'package:lighthouse/components/signup_button.dart';
import 'package:lighthouse/utilities/constants.dart';
import 'package:lighthouse/utilities/styles.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final double padding = 36;
  final double buttonPadding = 18;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: SizedBox.expand(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 70, left: 36, right: 36),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 70),
                      child: SizedBox(
                        width: double.infinity,
                        child: Text(
                          "추가 정보를\n입력해 주세요.",
                          style: signUpTitleStyle,
                        ),
                      ),
                    ),
                    //컴포넌트 여기에 추가
                  ],
                ),
              ),
              SizedBox(
                width: size.width * 1 - buttonPadding * 2,
                child: Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 33),
                  child: SignUpButton(
                    text: "저장 후 시작하기",
                    onPressed: (){},
                  ),
                ),
              ),
          ]
        ),
      ),
    );
  }
}
