import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lighthouse/components/signup_button.dart';
import 'package:lighthouse/screens/signup/components/signup_title.dart';
import 'package:lighthouse/utilities/constants.dart';
import 'package:lighthouse/utilities/styles.dart';

import '../components/single_choice.dart';

class Interests extends StatefulWidget {
  _InterestsState createState() => _InterestsState();
}

class _InterestsState extends State<Interests> {
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<String> studyList = ["공부방법", "진로고민", "재수/n수"];
    List<String> lifeList = ["건강관리", "멘탈관리", "학교생활"];
    List<String> lifeList2 = ["생활패턴", "계획관리", "하나만더"];
    List<String> majorList = ["문과", "이과", "공과", "예체능"];
    String selectedMyList = "";
    int _choiceIdx;

    onSelectionChanged(String selectedList) {
      setState(() {
        selectedMyList = selectedList;
      });
    }

    Widget _buildLifeKeyWords() {
      return SizedBox(
        height: getHeightByScreenSize(size.height, 100),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 2.0,
            ),
            itemCount: lifeList.length,
            itemBuilder: (BuildContext context, int index) {
              return ChoiceChip(
                side: BorderSide(color: const Color(0xffd9d9d9)),
                padding: EdgeInsets.fromLTRB(21, 8, 20, 8),
                label: Text(lifeList[index]),
                selected: _choiceIdx == index,
                selectedColor: const Color(0xfff2efff),
                onSelected: (bool selected) {
                  setState(() {
                    _choiceIdx = selected ? index : 0;
                  });
                },
                backgroundColor: Colors.white,
              );
            }),
      );
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            tooltip: '이전 페이지',
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SignUpTitle(
                title: "관심 있는\n키워드를 선택해 주세요.",
                subTitle: "대학생의 경우, 해당 키워드 관련 고민 편지/채팅을 받습니다.",
                myStyle: signUpSubTitleStyle2,
                myPadding: EdgeInsets.only(bottom: 60),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '학업',
                      style: moreInfoSubText,
                    ),
                    SingleChoice(
                      studyList,
                      EdgeInsets.fromLTRB(21, 8, 20, 8),
                      onSelectionChanged: onSelectionChanged,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 22),
                    ),
                    Text(
                      '생활 관리',
                      style: moreInfoSubText,
                    ),
                    // _buildLifeKeyWords(),
                    SingleChoice(
                      lifeList,
                      EdgeInsets.fromLTRB(21, 8, 20, 8),
                      onSelectionChanged: onSelectionChanged,
                    ),
                    SingleChoice(
                      lifeList2,
                      EdgeInsets.fromLTRB(21, 8, 20, 8),
                      onSelectionChanged: onSelectionChanged,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 22),
                    ),
                    Text('전공', style: moreInfoSubText),
                    SingleChoice(
                      majorList,
                      EdgeInsets.fromLTRB(13, 8, 14, 8),
                      onSelectionChanged: onSelectionChanged,
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
        ));
  }
}
