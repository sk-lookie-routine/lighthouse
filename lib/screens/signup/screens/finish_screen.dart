import 'package:flutter/material.dart';
import 'package:lighthouse/components/buttons/gradeinfo_text_button.dart';
import 'package:lighthouse/components/buttons/rounded_finish_button.dart';
import 'package:lighthouse/components/texts/title.dart';
import 'package:lighthouse/entity/user.dart';
import 'package:lighthouse/screens/home/home_screen.dart';
import 'package:lighthouse/utilities/colors.dart';
import 'package:lighthouse/utilities/fonts.dart';
import 'package:lighthouse/utilities/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FinishScreen extends StatelessWidget {
  static const String id = 'finish_screen';
  // User user;
  // FinishScreen(this.user);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.clear),
          tooltip: '끄기',
          color: Colors.black,
          onPressed: () {
            Navigator.pushNamed(
              context,
              HomeScreen.id,
            );
          },
        ),
      ),
      body: Container(
        height: size.height,
        width: double.infinity,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: ScreenUtil().setWidth(36)),
                    child: SignUpTitle(
                      title: "축하해요!\n가입이 완료되었습니다.",
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                          width: ScreenUtil().setWidth(170),
                          height: ScreenUtil().setWidth(170),
                          decoration:
                              BoxDecoration(color: const Color(0xfff1f1f1))),
                      Padding(
                        padding:
                            EdgeInsets.only(top: ScreenUtil().setHeight(23)),
                        child: Text.rich(
                          TextSpan(
                            text: "등대지기",
                            style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.bold,
                                fontFamily: notoSans,
                                fontSize: ScreenUtil().setSp(14)),
                            children: <TextSpan>[
                              TextSpan(
                                text: " 등급으로 시작합니다",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: notoSans,
                                    fontSize: ScreenUtil().setSp(14)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GradeInfoTextButton(),
                    ],
                  ),
                ],
              ),
              SizedBox(
                width: ScreenUtil().setWidth(325),
                child: Padding(
                  padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(33)),
                  child: RoundedFinishedButton(
                    text: "홈 화면으로 이동",
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        HomeScreen.id,
                      );
                    }, //홈으로 이동
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
