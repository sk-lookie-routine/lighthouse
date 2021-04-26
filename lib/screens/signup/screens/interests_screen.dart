import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lighthouse/components/buttons/rounded_finish_button.dart';
import 'package:lighthouse/components/chips/keywords_chip_group.dart';
import 'package:lighthouse/components/texts/title.dart';
import 'package:lighthouse/screens/signup/screens/moreinfo_screen.dart';
import 'package:lighthouse/utilities/styles.dart';
import 'package:lighthouse/utilities/variables.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InterestsScreen extends StatefulWidget {
  static const String id = 'interests_screen';
  _InterestsScreenState createState() => _InterestsScreenState();
}

class _InterestsScreenState extends State<InterestsScreen> {
  List<String> _selectedKeywordsList = [];
  bool _isButtonAble = false;

  _isAllKeywordsSelected(){
    if(_selectedKeywordsList.contains("")) _isButtonAble = false;
    else _isButtonAble = true;
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    SizedBox _sizedBox = SizedBox(
      height: ScreenUtil().setWidth(28),
    );
    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            TextButton(
              child: Text("다음"),
              onPressed: _isButtonAble?
                  (){
                    Navigator.pushNamed(
                      context,
                      MoreInfoScreen.id,
                    );
                  }:null,
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(36)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SignUpTitle(
                title: "관심 있는\n키워드를 선택해 주세요.",
                subTitle: "대학생의 경우, 해당 키워드 관련 고민 편지/채팅을 받습니다.",
              ),
              Expanded(
                child: Column(
                  children: [
                    _sizedBox,
                    KeywordsChipGroup(
                      title: "학업",
                      keywordsList: Keywords.academic,
                      onSelectionChanged: (selectedKeyword) {
                        setState(() {
                          _selectedKeywordsList[0] = selectedKeyword;
                          _isAllKeywordsSelected();
                        });
                      },
                      crossAxisCount: 3,
                    ),
                    _sizedBox,
                    KeywordsChipGroup(
                      title: "생활 관리",
                      keywordsList: Keywords.lifeManagement,
                      onSelectionChanged: (selectedKeyword) {
                        setState(() {
                          _selectedKeywordsList[1] = selectedKeyword;
                          _isAllKeywordsSelected();
                        });
                      },
                      crossAxisCount: 3,
                    ),
                    _sizedBox,
                    KeywordsChipGroup(
                      title: "전공",
                      keywordsList: Keywords.major,
                      onSelectionChanged: (selectedKeyword) {
                        setState(() {
                          _selectedKeywordsList[2] = selectedKeyword;
                          _isAllKeywordsSelected();
                        });
                      },
                      crossAxisCount: 4,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
