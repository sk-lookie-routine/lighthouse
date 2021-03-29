import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lighthouse/components/signup_button.dart';
import 'package:lighthouse/components/warning_alert_dialog.dart';
import 'package:lighthouse/screens/signup/components/moreinfo_keyword.dart';
import 'package:lighthouse/screens/signup/screen/nickname_screen.dart';
import 'package:lighthouse/screens/signup/components/signup_title.dart';
import 'package:lighthouse/services/show_alert_dialog.dart';
import 'package:lighthouse/utilities/colors.dart';
import 'package:lighthouse/utilities/constants.dart';
import 'package:lighthouse/utilities/fonts.dart';
import 'package:lighthouse/utilities/styles.dart';

import '../components/single_choice.dart';

class Interests extends StatefulWidget {
  _InterestsState createState() => _InterestsState();
}

class _InterestsState extends State<Interests> {
  bool _selected = false;
  bool isUniversity = false;
  bool isHighSchool = false;
  bool isOthers = false;
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
    List<String> otherList = ["검정고시", "재수/n수", "반수/편입"];
    String selectedMyList;
    double width;

    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SignUpTitle(
            title: "관심 있는\n키워드를 선택해 주세요.",
            subTitle: "대학생의 경우, 해당 키워드 관련 고민 편지/채팅을 받습니다.",
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
                        selectedMyList = selectedList;
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
                        selectedMyList = selectedList;
                        if (selectedMyList == schoolList[1].toString()) {
                          isUniversity = true;
                          isHighSchool = false;
                          isOthers = false;
                        } else if (selectedMyList == schoolList[0].toString()) {
                          isHighSchool = true;
                          isUniversity = false;
                          isOthers = false;
                        } else {
                          isUniversity = false;
                          isHighSchool = false;
                          isOthers = true;
                        }
                      });
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 22),
                  ),
                  isUniversity
                      ? _majorInfo()
                      : (isHighSchool
                          ? KeyWordInfo(
                              gradeList, EdgeInsets.fromLTRB(28, 8, 28, 8))
                          : KeyWordInfo(
                              otherList, EdgeInsets.fromLTRB(19, 8, 19, 8)))
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

Widget _majorInfo() {
  return Wrap(
    children: [
      Text(
        '학과',
        style: moreInfoSubText,
      ),
      Padding(padding: EdgeInsets.only(bottom: 30)), //패딩 9 주면 너무 가까움..
      Container(
          height: 48,
          child: TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: '학과 입력',
                prefixText: ' ',
                contentPadding: EdgeInsets.fromLTRB(16, 12, 0, 12),
                hintStyle: TextStyle(
                  fontSize: 16,
                  fontFamily: notoSans,
                  color: const Color(0xff999999),
                )),
          )),
      Padding(
        padding: EdgeInsets.only(bottom: 250),
      ),
    ],
  );
}
