import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lighthouse/components/signup_button.dart';
import 'package:lighthouse/screens/bottom.dart';
import 'package:lighthouse/screens/signup/components/signup_title.dart';
import 'package:lighthouse/screens/signup/components/single_choice.dart';
import 'package:lighthouse/utilities/colors.dart';
import 'package:lighthouse/utilities/constants.dart';
import 'package:lighthouse/utilities/styles.dart';

class LetterKeyWords extends StatefulWidget {
  _LetterKeyWordsState createState() => _LetterKeyWordsState();
}

class _LetterKeyWordsState extends State<LetterKeyWords> {
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<String> studyList = ["공부방법", "진로고민", "재수/n수"];
    List<String> lifeList = ["건강관리", "멘탈관리", "학교생활"];
    List<String> lifeList2 = ["생활패턴", "계획관리", "하나만더"];
    // 수정 하기
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
        backgroundColor: primaryColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          tooltip: '이전 페이지',
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(color: primaryColor),
          ),
          SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SignUpTitle(
                  title: "고민 키워드를\n선택해 주세요.",
                  titleStyle: letterKeyWordTitleStyle,
                  myPadding: EdgeInsets.only(bottom: 0),
                ),
                Stack(
                  children: [
                    Container(
                      height: getHeightByScreenSize(size.height, 500),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25),
                          )),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                Container(
                                    width: 38,
                                    height: 12,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        color: Color(0xff1c465fec))),
                                Text(
                                  '학업',
                                  style: moreInfoSubText,
                                ),
                              ],
                            ),

                            SingleChoice(
                              studyList,
                              EdgeInsets.fromLTRB(21, 8, 20, 8),
                              onSelectionChanged: onSelectionChanged,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 22),
                            ),
                            Stack(
                              children: [
                                Container(
                                    width: 67,
                                    height: 12,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        color: Color(0xff1c465fec))),
                                Text(
                                  '생활 관리',
                                  style: moreInfoSubText,
                                ),
                              ],
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
                            Stack(
                              children: [
                                Container(
                                    width: 38,
                                    height: 12,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        color: Color(0xff1c465fec))),
                                Text(
                                  '전공',
                                  style: moreInfoSubText,
                                ),
                              ],
                            ),
                            SingleChoice(
                              majorList,
                              EdgeInsets.fromLTRB(13, 8, 14, 8),
                              onSelectionChanged: onSelectionChanged,
                            ),
                            SizedBox(
                              width: size.width * 1 - buttonPadding * 2,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 15, bottom: 33),
                                child: SignUpButton(
                                  text: "선택 완료",
                                  onPressed: () {},
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset("assets/icons/chat.png",
                                    width: 21, height: 35),
                                Image.asset("assets/icons/home.png",
                                    width: 21, height: 35),
                                Image.asset("assets/icons/news.png",
                                    width: 21, height: 35),
                                Image.asset("assets/icons/test.png",
                                    width: 21, height: 35),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
