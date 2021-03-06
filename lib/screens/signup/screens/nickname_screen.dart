import 'package:flutter/material.dart';
import 'package:lighthouse/classes/user.dart';
import 'package:lighthouse/components/buttons/double_check_button.dart';
import 'package:lighthouse/components/texts/title.dart';
import 'package:lighthouse/screens/signup/screens/interests_screen.dart';
import 'package:lighthouse/services/show_alert_dialog.dart';
import 'package:lighthouse/utilities/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NickNameScreen extends StatefulWidget {
  static const String id = 'nickname_screen';
  _NickNameScreenState createState() => _NickNameScreenState();
}

class _NickNameScreenState extends State<NickNameScreen> {
  User user = User();
  bool _checkboxValue = false;
  bool _isButtonAble = false;
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
            _isButtonAble = false;
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
      setState(() {});
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
        contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        border: OutlineInputBorder(),
        hintText: '????????? ??????',
        counterText: '$_textCount/?????? 5???',
        suffixIcon: FutureBuilder(
            future: getSuffixIcon(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              //data??? ?????? ?????? ?????? ????????????
              if (snapshot.hasData == false) {
                return CircularProgressIndicator();
              }
              //error??? ???????????? ??? ??????
              else if (snapshot.hasError) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Error',
                    style: TextStyle(fontSize: 10),
                  ),
                );
              }
              // ???????????? ??????????????? ???????????? ??????
              else {
                return snapshot.data;
              }
            }),
      ),
      validator: (name) {
        if (name.isEmpty) {
          return '???????????? ???????????????.';
        } else if (name.length > 5) {
          return '5?????? ????????? ??????????????????.';
        }
        return null;
      },
      onChanged: (String nickname) {
        setState(() {
          _isButtonAble = false;
          _textCount = _userNickNameController.text.length;
        });
      },
      onSaved: (name) => user.nickname = name,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          TextButton(
            child: Text("??????"),
            onPressed: _isButtonAble
                ? () {
                    showAlertDialog(
                      context,
                      "??????!",
                      "??? ??? ????????? ???????????? ?????? ??? ????????????.\n????????? ????????????????",
                      () {
                        Navigator.pop(context);
                      },
                      () {
                        Navigator.pop(context);
                        Get.to(InterestsScreen(), arguments: user);
                      });
            } : null,
          ),
        ],
      ),
      body: Container(
        height: size.height,
        width: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(36)),
              child: SignUpTitle(
                title: "????????????\n????????? ?????????.",
                subTitle: "???????????? ?????? ??? ????????? ????????? ???????????????!",
              ),
            ),
            SizedBox(
              height: ScreenUtil().setWidth(44),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(20)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Form(
                      key: _formKey,
                      child: UserNickNameInput(),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: ScreenUtil().setWidth(5)),
                    child: DoubleCheckButton(
                      onPressed: (){
                        if(_formKey.currentState.validate()){
                          setState(() {
                            _formKey.currentState.save();
                            _isButtonAble = true;
                            print(user.nickname);
                          });
                        }
                      }
                      ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
