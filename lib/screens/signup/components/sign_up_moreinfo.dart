import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lighthouse/components/signup_button.dart';
import 'package:lighthouse/screens/signup/components/nickname.dart';
import 'package:lighthouse/screens/signup/components/signup_title.dart';
import 'package:lighthouse/utilities/colors.dart';
import 'package:lighthouse/utilities/constants.dart';
import 'package:lighthouse/utilities/styles.dart';

import 'single_choice.dart';

class SignUpMoreInfo extends StatefulWidget {
  _SignUpMoreInfoState createState() => _SignUpMoreInfoState();
}

class _SignUpMoreInfoState extends State<SignUpMoreInfo> {
  bool _selected = false;
  void onSelected(bool selected) {
    setState(() {
      _selected = !_selected;
    });
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<String> sexList = ["여자", "남자"];
    List<String> schoolList = ["고등학교", "대학교", "그 외"];
    List<String> gradeList = ["1학년", "2학년", "3학년"];
    String selectedsexList;
    double width;
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SignUpTitle(
            title: "추가 정보를\n입력해 주세요.",
          ),
          SizedBox(
            height: getHeightByScreenSize(size.height, 310),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36),
              child: ListView(
                children: [
                  Text(
                    '성별',
                    style: moreInfoSubText,
                  ),
                  SingleChoice(
                    sexList,
                    EdgeInsets.fromLTRB(54, 11, 54, 11),
                    onSelectionChanged: (selectedList) {
                      setState(() {
                        selectedsexList = selectedList;
                      });
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 22),
                  ),
                  Text(
                    '학교',
                    style: moreInfoSubText,
                  ),
                  SingleChoice(
                    schoolList,
                    EdgeInsets.fromLTRB(19, 8, 19, 8),
                    onSelectionChanged: (selectedList) {
                      setState(() {
                        selectedsexList = selectedList;
                      });
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 22),
                  ),
                  Text(
                    '학과',
                    style: moreInfoSubText,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(36, 0, 36, 0),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: '학과 입력',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 22),
                  ),
                  Text(
                    '학년',
                    style: moreInfoSubText,
                  ),
                  SingleChoice(
                    gradeList,
                    EdgeInsets.fromLTRB(19, 8, 19, 8),
                    onSelectionChanged: (selectedList) {
                      setState(() {
                        selectedsexList = selectedList;
                      });
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 100),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: size.width * 1 - buttonPadding * 2,
            child: Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 33),
              child: SignUpButton(
                text: "저장 후 시작하기",
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
