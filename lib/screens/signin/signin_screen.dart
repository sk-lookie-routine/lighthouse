import 'package:flutter/material.dart';
import 'package:lighthouse/components/buttons/rounded_finish_button.dart';
import 'package:lighthouse/components/signup_text_and_button.dart';
import 'package:lighthouse/screens/signin/components/background.dart';
import 'package:lighthouse/utilities/colors.dart';
import 'package:lighthouse/utilities/fonts.dart';
import 'package:lighthouse/utilities/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'components/find_account_button.dart';

class SignInScreen extends StatefulWidget {
  static const String id = 'signin_screen';
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  String _userEmail = "";
  String _userPassword = "";
  final _userEmailController = TextEditingController();
  final _userPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void initState() {
    _userEmailController.addListener(() {
      setState(() {});
    });
    _userPasswordController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  void dispose() {
    _userEmailController.dispose();
    _userPasswordController.dispose();
    super.dispose();
  }

  Widget _userEmailInput() {
    return SizedBox(
      width: ScreenUtil().setWidth(325),
      child: TextField(
        controller: _userEmailController,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          border: OutlineInputBorder(),
          hintText: '아이디(이메일)',
        ),
      ),
    );
  }
  Widget _userPasswordInput() {
    return SizedBox(
      width: ScreenUtil().setWidth(325),
      child: TextField(
        controller: _userPasswordController,
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          border: OutlineInputBorder(),
          hintText: '비밀번호',
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "이메일 로그인",
          style: appBarTitleDarkTextStyle,
        ),
      ),
      body: Background(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: ScreenUtil().setHeight(66)),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(12)),
                    child: _userEmailInput(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(12)),
                    child: _userPasswordInput(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(15)),
                    child: SizedBox(
                      width: ScreenUtil().setWidth(325),
                      child: RoundedFinishedButton(
                        text: '로그인하기',
                        onPressed: (){},
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FindAccountButton(
                        text: "아이디 찾기",
                        iconData: Icons.face,
                        onPressed: (){},
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(16)),
                        child: Container(
                          color: const Color(0xffb2b2b2),
                          width: 1,
                          height: ScreenUtil().setHeight(16),
                        ),
                      ),
                      FindAccountButton(
                        text: "비밀번호 찾기",
                        iconData: Icons.vpn_key,
                        onPressed: (){},
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SignUpTextAndButton(context: context),
          ],
        ),
      ),
    );
  }
}
