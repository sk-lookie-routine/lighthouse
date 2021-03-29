import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:lighthouse/components/gradeinfo_button.dart';
import 'package:lighthouse/components/signup_button.dart';
import 'package:lighthouse/screens/signup/components/signup_title.dart';
import 'package:lighthouse/screens/signup/components/single_choice.dart';
import 'package:lighthouse/utilities/constants.dart';
import 'package:lighthouse/utilities/styles.dart';

class InterestKeyword extends StatefulWidget {
  @override
  _InterestKeywordState createState() => _InterestKeywordState();
}

class _InterestKeywordState extends State<InterestKeyword> {
  bool _selected = false;
  String _selectedList;

  List<String> _ACADEMIC = ["공부방법", "진로고민", "재수/n수"];
  List<String> _LIFE_MANAGE = ["건강관리", "멘탈관리", "학교생활", "생활패턴", "계획관리"];
  List<String> _MAJOR = ["문과", "이과", "공과", "예체능"];

  void onSelected(bool selected) {
    setState(() {
      _selected = !_selected;
    });
  }

  @override
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
                  title: "관심 있는\n키워드를 선택해 주세요.",
                  subTitle: "대학생의 경우, 해당 키워드 관련 고민 편지/채팅을 받습니다.",
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 31),
                  child: SizedBox(
                    height: getHeightByScreenSize(size.height, 271),
                    child: ListView(
                      children: [
                        Text(
                          '학업',
                          style: moreInfoSubText,
                        ),
                        Text(
                          '생활관리',
                          style: moreInfoSubText,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SingleChoice(
                              _LIFE_MANAGE,
                              null,
                              onSelectionChanged: (selectedList) {
                                setState(() {
                                  _selectedList = selectedList;
                                });
                              },
                            ),
                          ],
                        ),
                        Text(
                          '학업',
                          style: moreInfoSubText,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SingleChoice(
                              _MAJOR,
                              null,
                              onSelectionChanged: (selectedList) {
                                setState(() {
                                  _selectedList = selectedList;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: size.width * 1 - buttonPadding * 2,
              child: Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 33),
                child: SignUpButton(
                  text: "확인",
                  onPressed: () {},
                ),
              ),
            ),
          ]),
    );
  }
}
