import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lighthouse/components/buttons/rounded_finish_button.dart';
import 'package:lighthouse/screens/signup/screens/nickname_screen.dart';
import 'package:lighthouse/utilities/fonts.dart';
import 'package:lighthouse/utilities/styles.dart';

class SignUpScreen extends StatefulWidget {
  static const String id = 'signup_screen';
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String _userEmail = "";
  String _userPassword = "";
  String _userConfirmPassword = "";
  final _userEmailController = TextEditingController();
  final _userPasswordController = TextEditingController();
  final _userPasswordConfirmController = TextEditingController();

  void initState() {
    _userEmailController.addListener(() {
      setState(() {});
    });
    _userPasswordController.addListener(() {
      setState(() {});
    });
    _userPasswordConfirmController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  void dispose() {
    _userEmailController.dispose();
    _userPasswordController.dispose();
    _userPasswordConfirmController.dispose();
    super.dispose();
  }

  Widget _userEmailInput() {
    return SizedBox(
      width: ScreenUtil().setWidth(325),
      child: TextFormField(
        controller: _userEmailController,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          border: OutlineInputBorder(),
          hintText: 'example@example.com',
          helperText: '아이디(이메일)',
          helperStyle: TextStyle(
              color:  const Color(0xffb2b2b2),
              fontWeight: FontWeight.w400,
              fontFamily: notoSans,
              fontSize: ScreenUtil().setSp(10)
          ),
        ),
      ),
    );
  }

  Widget _userPasswordInput() {
    return SizedBox(
      width: ScreenUtil().setWidth(325),
      child: TextFormField(
        controller: _userPasswordController,
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          border: OutlineInputBorder(),
          hintText: '비밀번호',
          helperText: '비밀번호',
          helperStyle: TextStyle(
              color:  const Color(0xffb2b2b2),
              fontWeight: FontWeight.w400,
              fontFamily: notoSans,
              fontSize: ScreenUtil().setSp(10)
          ),
        ),
      ),
    );
  }

  Widget _userPasswordConfirmInput() {
    return SizedBox(
      width: ScreenUtil().setWidth(325),
      child: TextFormField(
        controller: _userPasswordConfirmController,
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          border: OutlineInputBorder(),
          hintText: '비밀번호 확인',
          helperText: '비밀번호 확인',
          helperStyle: TextStyle(
              color:  const Color(0xffb2b2b2),
              fontWeight: FontWeight.w400,
              fontFamily: notoSans,
              fontSize: ScreenUtil().setSp(10)
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "회원가입",
          style: appBarTitleDefaultextStyle,
        ),
      ),
      body: Container(
        width: size.width * 1,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: ScreenUtil().setHeight(66)),
                child: Padding(
                  padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(12)),
                  child: _userEmailInput(),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(12)),
                child: _userPasswordInput(),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(12)),
                child: _userPasswordConfirmInput(),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(15)),
                child: SizedBox(
                  width: ScreenUtil().setWidth(325),
                  child: RoundedFinishedButton(
                    text: '가입하기',
                    onPressed: () {
                      Navigator.pushNamed(
                          context,
                          NickNameScreen.id
                      );
                    },
                  ),
                ),
              ),
            ]
        ),
      ),
    );
  }
}
