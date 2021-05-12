import 'package:flutter/material.dart';
import 'package:lighthouse/screens/letter/components/no_letter_inform.dart';
import 'package:lighthouse/screens/letter/components/received_letter.dart';
import 'package:lighthouse/screens/letter/components/stamp_count_button.dart';
import 'package:lighthouse/screens/letter/components/top_container.dart';
import 'package:lighthouse/utilities/colors.dart';
import 'package:lighthouse/utilities/fonts.dart';
import 'package:lighthouse/utilities/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LetterBoxScreen extends StatelessWidget {
  static const String id = 'letterbox_screen';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          title: Text(
            "편지",
            style: appBarTitleLightTextStyle,
          ),
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          bottom: TabBar(
            tabs: [
              Tab(
                text: "받은 편지함",
              ),
              Tab(
                text: "편지 보관함",
              ),
            ],
            indicator: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(30.0),
                topRight: const Radius.circular(30.0),
              ),
            ),
            labelColor: primaryColor,
            labelStyle: TextStyle(
              fontFamily: notoSans,
              fontSize: ScreenUtil().setSp(14)
            ),
            unselectedLabelColor: Color(0xff464646),
            unselectedLabelStyle: TextStyle(
                fontFamily: notoSans,
                fontSize: ScreenUtil().setSp(14)
            ),
          ),
        ),
        body: TabBarView(
          children: [
            _receivedLetterBox(),
            _archivedLetterBox(),
          ],
        ),
      ),
    );
  }

  Widget _receivedLetterBox(){
    return Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(24)),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
              child: TopContainer(
                text: "다른 고민이 있다면\n언제든지 털어놓아보세요.",
                btnText: "새 편지 쓰러 가기",
                image: Image.asset(
                  "assets/images/airplane.png",
                  width: ScreenUtil().setWidth(72),
                ),
                backgroundColor: primaryLightColor,
                btnTextColor: primaryColor,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: ScreenUtil().setHeight(14)),
              child: StampCountButton(
                count: 1, //임의의 숫자
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: ScreenUtil().setHeight(12.8)),
              child: Divider(
                  height: 0.5,
                  color: Color(0xffd9d9d9),
              ),
            ),
            ReceivedLetter(),
            ReceivedLetter(),
          ],
        ),
      ),
    );
  }

  Widget _archivedLetterBox(){
    return Container(
      color: Colors.white,
      child: Center(
        child: NoLetterInform(),
      ),
    );
  }
}
