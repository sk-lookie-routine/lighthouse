import 'package:flutter/material.dart';
import 'package:lighthouse/components/signup_button.dart';
import 'package:lighthouse/screens/welcome/welcome_screen.dart';

class SignUpNickName extends StatefulWidget {
  _SignUpNickNameState createState() => _SignUpNickNameState();
}

class _SignUpNickNameState extends State<SignUpNickName> {
  final _nameTextEditController = TextEditingController();

  bool _isValid() {
    return (_nameTextEditController.text.length >= 1);
  }

  void _nextScreen() {
    //컴포넌트 교체
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            tooltip: '이전 페이지',
            color: Colors.black,
            onPressed: () {
            },
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 24),
                ),
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WelcomeScreen(),
                      ),
                    );
                  },
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(36, 60, 0, 0),
                )
              ],
            ),
            Container(
              padding: EdgeInsets.fromLTRB(36, 70, 0, 0),
              child: Text("닉네임을\n설정해 주세요.",
                  style: const TextStyle(
                      color: const Color(0xff1b1b1b),
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                      fontSize: 24.0),
                  textAlign: TextAlign.left),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(36, 10, 0, 0),
              child: Text(
                '원활한 의사소통을 위해 실명 가입을 추천합니다.',
                style: TextStyle(
                  fontSize: 14,
                  color: const Color(0xff999999),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
                alignment: Alignment(0.0, 0.0),
                padding: EdgeInsets.only(top: 44),
                child: Container(
                  width: 320,
                  height: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    border:
                        Border.all(color: const Color(0xff707070), width: 1),
                  ),
                  child: Container(
                    padding: EdgeInsets.only(left: 16),
                    child: TextField(
                        controller: _nameTextEditController,
                        onChanged: (text) {
                          setState(() {});
                        },
                        maxLength: 5,
                        decoration: InputDecoration(
                          hintText: "닉네임 입력",
                          hintStyle: const TextStyle(
                              color: const Color(0xff999999),
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              fontSize: 16.0),
                          counterText: '', // counter text를 비움으로 설정
                        ),
                        style: const TextStyle(
                            color: const Color(0xff1b1b1b),
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: 20.0),
                        textAlign: TextAlign.left),
                  ),
                )),
            Container(
              padding: EdgeInsets.fromLTRB(290, 5, 0, 0),
              child: Text(
                  (_nameTextEditController.text.length).toString() + "/최대 5자",
                  style: const TextStyle(
                      color: const Color(0xff515151),
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  textAlign: TextAlign.right),
            ),
            Container(
              width: 324,
              padding: EdgeInsets.fromLTRB(50, 10, 0, 0),
              child: SignUpButton(
                text: '설정 완료',
                onPressed: _isValid() ? _nextScreen : null,
                backgroundColor: _nameTextEditController.text.length >= 1
                    ? const Color(0xff5230ce)
                    : const Color(0xffd9d9d9),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
