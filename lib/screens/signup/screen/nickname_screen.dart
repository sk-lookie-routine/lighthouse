import 'package:flutter/material.dart';
import 'package:lighthouse/components/signup_button.dart';
import 'package:lighthouse/screens/signup/components/signup_title.dart';
import 'package:lighthouse/screens/signup/components/warning_alert_dialog.dart';
import 'package:lighthouse/utilities/constants.dart';

class NickName extends StatefulWidget {
  _NickNameState createState() => _NickNameState();
}

void showAlertDialog(BuildContext context) async {
  String result = await showDialog(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return WarningAlertDialog();
    },
  );
}

class _NickNameState extends State<NickName> {
  String _userNickName = "";
  final _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void initState() {
    _controller.addListener(() {
      if (_formKey.currentState.validate()) {
        _formKey.currentState.save();
      }
    });
    super.initState();
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String validateText(String value) {
    if (!(value.length > 5) && value.isNotEmpty) {
      return "Password should contain more than 5 characters";
    }
    return null;
  }

  Widget UserIdInput() {
    return TextFormField(
      autofocus: true,
      maxLength: 5,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: '닉네임 입력',
      ),
      textInputAction: TextInputAction.next,
      validator: (name) {
        if (name.isEmpty) {
          return '아이디를 입력하세요.';
        } else if (name.length > 5) {
          return '5글자 이내로 설정해주세요.';
        }
        return null;
      },
      onSaved: (name) => _userNickName = name,
    );
  }

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
                  title: "닉네임을\n설정해 주세요.",
                  subTitle: "닉네임은 바꿀 수 없으니 신중히 정해주세요!",
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: padding),
                  child: Form(
                    key: _formKey,
                    child: UserIdInput(),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: size.width * 1 - buttonPadding * 2,
              child: Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 33),
                child: SignUpButton(
                  text: "저장 후 시작하기",
                  onPressed: () {
                    showAlertDialog(context);
                  },
                ),
              ),
            ),
          ]),
    );
  }
}
