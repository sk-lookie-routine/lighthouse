import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lighthouse/classes/user.dart';
import 'package:lighthouse/components/chips/keywords_chip_single.dart';
import 'package:lighthouse/components/texts/title.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lighthouse/screens/signup/screens/finish_screen.dart';
import 'package:lighthouse/utilities/colors.dart';
import 'package:lighthouse/utilities/fonts.dart';
import 'package:lighthouse/utilities/variables.dart';

class MoreInfoScreen extends StatefulWidget {
  static const String id = 'moreinfo_screen';
  _MoreInfoScreenState createState() => _MoreInfoScreenState();
}

class _MoreInfoScreenState extends State<MoreInfoScreen> {
  User user = User(); //라우터에서 넘어오는 user객체로 값 저장
  bool _selected = false;

  Gender gender;
  String school;
  String grade;
  final _majorTextController = TextEditingController();

  bool _isAllEntered = false;
  Widget _widget = Container();

  _isAllKeywordsSelected() {
    //major = _majorTextController.text;
    if (gender != null && school != null && grade != null) {
      if (school == "대학교") {
        if (_majorTextController.text.isNotEmpty) {
          _isAllEntered = true;
          user.gender = gender;
          user.school = _majorTextController.text;
          user.grade = grade;
        }
      } else {
        _isAllEntered = true;
        user.gender = gender;
        user.school = _majorTextController.text;
        user.grade = grade;
      }
    } else {
      _isAllEntered = false;
    }
  }

  Widget _majorInfo(final controller, Function _isAllKeywordsSelected) {
    return Wrap(
      children: [
        Text(
          '학과',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: notoSans,
            fontSize: ScreenUtil().setSp(14),
          ),
        ),
        Padding(padding: EdgeInsets.only(bottom: 30)), //패딩 9 주면 너무 가까움..
        Container(
          height: 48,
          child: TextField(
            onChanged: (label) {
              setState(() {
                _isAllKeywordsSelected();
              });
            },
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: '학과 입력',
              prefixText: ' ',
              contentPadding: EdgeInsets.fromLTRB(16, 12, 0, 12),
              hintStyle: TextStyle(
                fontSize: 16,
                fontFamily: notoSans,
                color: const Color(0xff999999),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setWidth(45),
              vertical: ScreenUtil().setHeight(7)),
        ),
      ],
    );
  }
  // Widget _buildChip({int index, String label}) {
  //   return ChoiceChip(
  //     label: Text(
  //       label,
  //       style: TextStyle(
  //         color: Colors.black,
  //         fontFamily: notoSans,
  //         fontSize: ScreenUtil().setSp(14),
  //       ),
  //     ),
  //     onSelected: (isSelected) {},
  //     side: BorderSide(color: primaryColor),
  //     selectedColor: primaryLightColor,
  //     selected: false,
  //     backgroundColor: Colors.white,
  //     padding: EdgeInsets.symmetric(
  //         horizontal: ScreenUtil().setWidth(11),
  //         vertical: ScreenUtil().setHeight(7)),
  //   );
  // }

  _getChips(String selected, User user) {
    if (selected == Keywords.school[0]) {
      //고등학교
      _widget = KeywordsChipSingle(
        title: "학년",
        keywordsList: Keywords.highSchoolGrade,
        onSelectionChanged: (selectedKeyword, _selected) {
          setState(() {
            if (_selected == true) {
              grade = selectedKeyword;
              print(grade);
            } else {
              grade = null;
            }
            _isAllKeywordsSelected();
          });
        },
        crossAxisCount: 3,
        horizontalPadding: 20,
      );
    } else if (selected == Keywords.school[1]) {
      //대학교
      _widget = Column(children: [
        _majorInfo(_majorTextController, _isAllKeywordsSelected),
        KeywordsChipSingle(
          title: "학년",
          keywordsList: Keywords.collegeGrade,
          onSelectionChanged: (selectedKeyword, _selected) {
            setState(() {
              if (_selected == true) {
                grade = selectedKeyword;
                print(grade);
              } else {
                grade = null;
              }
              _isAllKeywordsSelected();
            });
          },
          crossAxisCount: 3,
          horizontalPadding: 20,
        )
      ]);
    } else if (selected == Keywords.school[2]) {
      //그외
      _widget = KeywordsChipSingle(
        title: "학년",
        keywordsList: Keywords.otherGrade,
        onSelectionChanged: (selectedKeyword, _selected) {
          setState(() {
            if (_selected == true) {
              grade = selectedKeyword;
              print(grade);
            } else {
              grade = null;
            }
            _isAllKeywordsSelected();
          });
        },
        crossAxisCount: 3,
        horizontalPadding: 10,
      );
    } else {
      return Container();
    }
  }

  List<String> _getGenderList() {
    //user.keywords["dfdf"] = false;
    List<String> genderList = [];
    genderLabel.forEach((key, value) {
      genderList.add(value);
    });
    return genderList;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        actions: <Widget>[
          TextButton(
            child: Text("완료"),
            onPressed: _isAllEntered
                ? () {
                    Navigator.pushNamed(
                      context,
                      FinishScreen.id,
                    );
                  }
                : null,
          ),
        ],
      ),
      body: SingleChildScrollView(
        //키보드 bottom overflow 해결
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(36)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SignUpTitle(
                title: "추가 정보를\n입력해 주세요.",
              ),
              Column(
                children: [
                  KeywordsChipSingle(
                    title: "성별",
                    keywordsList: _getGenderList(),
                    onSelectionChanged: (selectedKeyword, _selected) {
                      setState(() {
                        genderLabel.forEach((key, value) {
                          if (selectedKeyword == value && _selected == true) {
                            gender = key;
                            print(user.gender);
                          } else if (_selected == false) {
                            gender = null;
                          }
                        });
                        _isAllKeywordsSelected();
                      });
                    },
                    crossAxisCount: 2,
                    horizontalPadding: 45,
                  ),
                  KeywordsChipSingle(
                    title: "학교",
                    keywordsList: Keywords.school,
                    onSelectionChanged: (selectedKeyword, _selected) {
                      setState(() {
                        if (_selected == true) {
                          school = selectedKeyword;
                          grade = null;
                          print(school);
                          print(grade);
                          _getChips(selectedKeyword, user);
                          _isAllKeywordsSelected();
                        } else {
                          school = null;
                          grade = null;
                        }
                      });
                    },
                    crossAxisCount: 3,
                    horizontalPadding: 17,
                  ),
                  _widget,
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
