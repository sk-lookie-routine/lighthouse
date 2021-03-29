import 'package:flutter/material.dart';
import 'package:lighthouse/components/signup_button.dart';
import 'package:lighthouse/screens/signup/components/signup_title.dart';
import 'package:lighthouse/services/show_alert_dialog.dart';
import 'package:lighthouse/utilities/colors.dart';
import 'package:lighthouse/utilities/constants.dart';

class NickName extends StatefulWidget {
  _NickNameState createState() => _NickNameState();
}

class _NickNameState extends State<NickName> {
  String _userNickName = "";
  bool _isNotValid = false;
  final _userNickNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void initState() {
    _userNickNameController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  void dispose() {
    _userNickNameController.dispose();
    super.dispose();
  }

  String validateText(String value) {
    if (!(value.length > 5) && value.isNotEmpty) {
      return "Password should contain more than 5 characters";
    }
    return null;
  }

  Widget UserNickNameInput() {
    return TextFormField(
      controller: _userNickNameController,
      autofocus: true,
      maxLength: 5,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 18, horizontal: 20),
        border: OutlineInputBorder(),
        hintText: '닉네임 입력',
        suffixIcon: _userNickNameController.text.length > 0 ? IconButton(
            onPressed: () {
              _userNickNameController.clear();
            },
            icon: Icon(
                Icons.cancel_outlined,
                color: const Color(0xff707070),
            ),
        ) : null
      ),
      validator: (name) {
        if (name.isEmpty) {
          _isNotValid = true;
          return '닉네임을 입력하세요.';
        } else if (name.length > 5) {
          _isNotValid = true;
          return '5글자 이내로 설정해주세요.';
        }
        _isNotValid = false;
        return null;
      },
      onSaved: (name) => _userNickName = name,
      autovalidateMode: AutovalidateMode.onUserInteraction,
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
                    child: UserNickNameInput(),
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
                    if (_formKey.currentState.validate()) {
                    }
                    showAlertDialog(
                      context,
                      "잠깐!",
                      "한 번 설정한 닉네임은 바꿀 수 없습니다.\n이대로 진행할까요?",
                      (){},
                      (){},
                    );
                  },
                ),
              ),
            ),
          ]),
    );
  }
}
