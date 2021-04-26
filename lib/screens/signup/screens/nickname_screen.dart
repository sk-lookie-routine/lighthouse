import 'package:flutter/material.dart';
import 'package:lighthouse/components/texts/title.dart';
import 'package:lighthouse/screens/signup/screens/interests_screen.dart';
import 'package:lighthouse/services/show_alert_dialog.dart';
import 'package:lighthouse/utilities/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NickNameScreen extends StatefulWidget {
  static const String id = 'nickname_screen';
  _NickNameScreenState createState() => _NickNameScreenState();
}

class _NickNameScreenState extends State<NickNameScreen> {
  String _userNickName = "";
  bool _isNotValid = false;
  bool _checkboxValue = false;
  int _textCount = 0;
  final _userNickNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<Widget> getSuffixIcon() async {
    await Future.delayed(Duration(milliseconds: 20));
    final form = _formKey.currentState;
    print(form);
    if (form.validate()) {
      if (_userNickNameController.text.length > 0) {
        return IconButton(
          onPressed: () {
            _userNickNameController.clear();
          },
          icon: Icon(
            Icons.cancel_outlined,
            color: const Color(0xff707070),
          ),
        );
      } else {
        return null;
      }
    } else {
      return Icon(
        Icons.error,
        color: errorColor,
      );
    }
  }

  void initState() {
    _userNickNameController.addListener(() {
      setState(() {
      });
    });
    super.initState();
  }

  void dispose() {
    _userNickNameController.dispose();
    super.dispose();
  }

  Widget UserNickNameInput() {
    return TextFormField(
      controller: _userNickNameController,
      autofocus: true,
      maxLength: 5,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
        border: OutlineInputBorder(),
        hintText: '닉네임 입력',
        counterText: '$_textCount/최대 5자',
        suffixIcon: FutureBuilder(
            future: getSuffixIcon(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              //data를 아직 받아 오지 못했을때
              if (snapshot.hasData == false) {
                return CircularProgressIndicator();
              }
              //error가 발생하게 될 경우
              else if (snapshot.hasError) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Error',
                    style: TextStyle(fontSize: 10),
                  ),
                );
              }
              // 데이터를 정상적으로 받아오게 되면
              else {
                return snapshot.data;
              }
            }),
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
      onChanged: (String e) {
        setState(() {
          _textCount = _userNickNameController.text.length;
        });
      },
      onSaved: (name) => _userNickName = name,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }


  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          TextButton(
            child: Text("다음"),
            onPressed: () {
              showAlertDialog(
                  context, "잠깐!",
                  "한 번 설정한 닉네임은 바꿀 수 없습니다.\n이대로 진행할까요?",
                      () {Navigator.pop(context);},
                      () {
                    Navigator.pop(context);
                    Navigator.pushNamed(
                      context,
                      InterestsScreen.id,
                    );
                  }
              );
            },
          ),
        ],
      ),
      body: Container(
        height: size.height,
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal:ScreenUtil().setWidth(36)),
          child: Column(
            children: [
              SignUpTitle(
                title: "닉네임을\n설정해 주세요.",
                subTitle: "닉네임은 바꿀 수 없으니 신중히 정해주세요!",
              ),
              SizedBox(
                height: ScreenUtil().setWidth(44),
              ),
              Form(
                key: _formKey,
                child: UserNickNameInput(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
