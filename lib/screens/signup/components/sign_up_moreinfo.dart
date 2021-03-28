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
    return SizedBox.expand(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SignUpTitle(
            title: "추가 정보를\n입력해 주세요.",
          ),
          SizedBox(
            child: ListView(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(36, 0, 0, 12),
                  child: Text(
                    '성별',
                    style: moreInfoSubText,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SingleChoice(
                      sexList,
                      100,
                      onSelectionChanged: (selectedList) {
                        setState(() {
                          selectedsexList = selectedList;
                        });
                      },
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 22),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(36, 0, 0, 12),
                  child: Text(
                    '학교',
                    style: moreInfoSubText,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SingleChoice(
                      schoolList,
                      55,
                      onSelectionChanged: (selectedList) {
                        setState(() {
                          selectedsexList = selectedList;
                        });
                      },
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 22),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(36, 0, 0, 12),
                  child: Text(
                    '학년',
                    style: moreInfoSubText,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SingleChoice(
                      gradeList,
                      55,
                      onSelectionChanged: (selectedList) {
                        setState(() {
                          selectedsexList = selectedList;
                        });
                      },
                    ),
                  ],
                ),
              ],
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
