import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lighthouse/components/buttons/double_check_button.dart';
import 'package:lighthouse/components/buttons/rounded_finish_button.dart';
import 'package:lighthouse/components/texts/validate_text.dart';
import 'package:lighthouse/screens/signup/screens/nickname_screen.dart';
import 'package:lighthouse/services/auth_service.dart';
import 'package:lighthouse/utilities/colors.dart';
import 'package:lighthouse/utilities/fonts.dart';
import 'package:lighthouse/utilities/styles.dart';
import 'package:lighthouse/utilities/variables.dart';

class SignUpScreen extends StatefulWidget {
  static const String id = 'signup_screen';
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class ValidateTextStruct {
  String text = "";
  bool validateState = true;
}

class _SignUpScreenState extends State<SignUpScreen> {

  String _userEmail = "";
  String _userPassword = "";
  String _userConfirmPassword = "";

  bool _passwordVisible;
  bool _passwordConfirmVisible;

  ValidateTextStruct emailValidation = ValidateTextStruct();
  ValidateTextStruct passwordValidation = ValidateTextStruct();
  ValidateTextStruct passwordConfirmValidation = ValidateTextStruct();

  Color emailBorderColor = Color(0xffdc0000);
  Color passwordBorderColor = Color(0xffb2b2b2);
  Color passwordConfirmBorderColor = Color(0xffb2b2b2);
  
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
    _passwordVisible = true;
    _passwordConfirmVisible = true;
    super.initState();
  }

  void dispose() {
    _userEmailController.dispose();
    _userPasswordController.dispose();
    _userPasswordConfirmController.dispose();
    super.dispose();
  }

  validateEmail(String value) {
    Pattern pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value) || value == null){
      emailValidation.text = ValidationTexts.unValidEmailType;
      emailValidation.validateState = false;
    }
    else{
      emailValidation.text = "";
      emailValidation.validateState = true;
    }
  }

  validatePassword(String value) {
    Pattern pattern =
        r"^[a-zA-Z0-9.!@#$%&'*+/=?^_`{|}~-]{8,16}$";
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value) || value == null){
      passwordValidation.text = ValidationTexts.unValidPasswordType;
      passwordValidation.validateState = false;
    }
    else{
      passwordValidation.text = ValidationTexts.validatePassword;
      passwordValidation.validateState = true;
    }
  }

  validatePasswordConfirm(String value) {
    if (_userPassword != value || value == null){
      passwordConfirmValidation.text = ValidationTexts.notSamePassword;
      passwordConfirmValidation.validateState = false;
    }
    else{
      passwordConfirmValidation.text = "";
      passwordConfirmValidation.validateState = true;
    }
  }

  Widget _userEmailInput() {
    return TextField(
      controller: _userEmailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        border: OutlineInputBorder(
        ),
        hintText: 'example@example.com',
      ),
      onChanged: (email) {
        _userEmail = email;
        setState(() {
          validateEmail(_userEmail);
          if(emailValidation.validateState){
            emailBorderColor = primaryColor;
          }else{
            emailBorderColor = errorColor;
          }
          print(emailBorderColor);
        });
      },
    );
  }

  Widget _userPasswordInput() {
    return TextField(
      controller: _userPasswordController,
      keyboardType: TextInputType.visiblePassword,
      obscureText: _passwordVisible,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        border: OutlineInputBorder(),
        hintText: '비밀번호',
          suffixIcon: IconButton(
            icon: Icon(
              _passwordVisible ? Icons.visibility : Icons.visibility_off,
              color: Color(0xffb2b2b2),
            ),
            onPressed: () {
              setState(() {
                _passwordVisible = !_passwordVisible;
              });
            },
          )
      ),
      onChanged: (password) {
        _userPassword = password;
        validatePassword(password);
      },
    );
  }

  Widget _userPasswordConfirmInput() {
    return TextField(
      controller: _userPasswordConfirmController,
      keyboardType: TextInputType.visiblePassword,
      obscureText: _passwordConfirmVisible,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        border: OutlineInputBorder(),
        hintText: '비밀번호 확인',
        suffixIcon: IconButton(
          icon: Icon(
            _passwordConfirmVisible ? Icons.visibility : Icons.visibility_off,
            color: Color(0xffb2b2b2),
          ),
          onPressed: () {
            setState(() {
              _passwordConfirmVisible = !_passwordConfirmVisible;
            });
          },
        )
      ),
      onChanged: (password) {
        _userConfirmPassword = password;
        validatePasswordConfirm(password);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "회원가입",
          style: appBarTitleDarkTextStyle,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(20)),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: ScreenUtil().setHeight(45)),
                child: SizedBox(
                  width: size.width * 1,
                  child: Text(
                    "아이디 (이메일)",
                    style: SignUpMiniTitleTextStyle,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: ScreenUtil().setHeight(5), bottom: ScreenUtil().setHeight(5)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                        child: _userEmailInput()
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: ScreenUtil().setWidth(5)),
                      child: DoubleCheckButton(
                        onPressed: (){},
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: ScreenUtil().setWidth(11)),
                child: SizedBox(
                  width: size.width * 1,
                  child: ValidateText(
                    label: emailValidation.text,
                    validateState: emailValidation.validateState,
                  ),
                ),
              ),
              SizedBox(
                width: size.width * 1,
                child: Text(
                    "비밀번호",
                    style: SignUpMiniTitleTextStyle,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: ScreenUtil().setHeight(5), bottom: ScreenUtil().setHeight(5)),
                child: _userPasswordInput(),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: ScreenUtil().setWidth(11)),
                child: SizedBox(
                  width: size.width * 1,
                  child: ValidateText(
                    label: passwordValidation.text,
                    validateState: passwordValidation.validateState,
                  ),
                ),
              ),
              SizedBox(
                width: size.width * 1,
                child: Text(
                  "비밀번호 확인",
                  style: SignUpMiniTitleTextStyle,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: ScreenUtil().setHeight(5), bottom: ScreenUtil().setHeight(5)),
                child: _userPasswordConfirmInput(),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: ScreenUtil().setWidth(15)),
                child: SizedBox(
                  width: size.width * 1,
                  child: ValidateText(
                    label: passwordConfirmValidation.text,
                    validateState: passwordConfirmValidation.validateState,
                  ),
                ),
              ),
              SizedBox(
                width: size.width * 1,
                child: RoundedFinishedButton(
                  text: '가입하기',
                  onPressed: () {
                    AuthService().signUp(_userEmail, _userPassword);
                    Navigator.pushNamed(
                        context,
                        NickNameScreen.id
                    );
                  },
                ),
              ),
            ]
        ),
      ),
    );
  }
}
