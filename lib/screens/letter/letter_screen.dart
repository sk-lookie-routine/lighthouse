import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lighthouse/components/buttons/rounded_finish_button.dart';
import 'package:lighthouse/components/chips/keywords_chip_group.dart';
import 'package:lighthouse/components/texts/title.dart';
import 'package:lighthouse/utilities/colors.dart';
import 'package:lighthouse/utilities/variables.dart';

class LetterScreen extends StatefulWidget {
  static const String id = 'letter_screen';
  @override
  _LetterScreenState createState() => _LetterScreenState();
}

class _LetterScreenState extends State<LetterScreen> {
  String selectedKeywordsList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(36)),
              child: SignUpTitle(
                title: "고민 키워드를\n선택해 주세요",
                titleColor: Colors.white,
              ),
            ),
            Container(
              height: ScreenUtil().setHeight(435),
              decoration: new BoxDecoration(
                  color: Colors.white,
                  borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(30.0),
                    topRight: const Radius.circular(30.0),
                  )),
              padding: EdgeInsets.only(
                top: ScreenUtil().setHeight(29),
                bottom: ScreenUtil().setHeight(13),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: ScreenUtil().setWidth(31)),
                    child: KeywordsChipGroup(
                      title: "학업",
                      isTitleMarked: true,
                      keywordsList: Keywords.academic,
                      onSelectionChanged: (selectedList) {
                        setState(() {
                          selectedKeywordsList = selectedList;
                        });
                      },
                      crossAxisCount: 3,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: ScreenUtil().setWidth(31)),
                    child: KeywordsChipGroup(
                      title: "생활 관리",
                      isTitleMarked: true,
                      keywordsList: Keywords.lifeManagement,
                      onSelectionChanged: (selectedList) {
                        setState(() {
                          selectedKeywordsList = selectedList;
                        });
                      },
                      crossAxisCount: 3,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: ScreenUtil().setWidth(31)),
                    child: KeywordsChipGroup(
                      title: "전공",
                      keywordsList: Keywords.major,
                      onSelectionChanged: (selectedList) {
                        setState(() {
                          selectedKeywordsList = selectedList;
                        });
                      },
                      crossAxisCount: 4,
                    ),
                  ),
                  SizedBox(
                    width: ScreenUtil().setWidth(325),
                    child: RoundedFinishedButton(
                      text: '선택 완료',
                      onPressed: () {},
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
