import 'package:flutter/material.dart';
import 'file:///C:/Users/yujin/OneDrive/lighthouse/lib/screens/letter/components/squared_letter_keyword.dart';
import 'package:lighthouse/utilities/colors.dart';
import 'package:lighthouse/utilities/fonts.dart';
import 'package:lighthouse/utilities/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  final int horizontalPadding = 24;
  Widget _profileSummary(){
    return Container(
        width: ScreenUtil().setWidth(312),
        height: ScreenUtil().setHeight(155),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
                Radius.circular(30)
            ),
            color: primaryLightColor
        )
    );
  }

  Widget _level(){
    return Column(
      children: [
        _subTitle("등급", true),
      ],
    );
  }

  Widget _interestKeywords(BuildContext context){
    return Column(
      children: [
        _subTitle("관심 키워드", false),
        SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: _getKeywords(["생활패턴", "예체능", "공부방법", "멘탈관리", "공부방법", "멘탈관리"]),
          ),
        ),
      ],
    );
  }

  Widget _chatAppointment(){
    return Column(
      children: [
        _subTitle("채팅 상담 예약현황", true),
        Container(
          padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(86)),
            width: ScreenUtil().setWidth(312),
            height: ScreenUtil().setHeight(119),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                    Radius.circular(15)
                ),
                color: const Color(0xfffff1be)
            ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "예약",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: notoSans,
                        fontSize: ScreenUtil().setSp(13.0)
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: ScreenUtil().setWidth(48),
                    height: ScreenUtil().setHeight(39),
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                    Radius.circular(10)
                    ),
                    color: Colors.white
                    ),
                    child: Text(
                        "N건",
                        style: TextStyle(
                          color:  const Color(0xfffb9905),
                          fontWeight: FontWeight.bold,
                          fontFamily: notoSans,
                          fontSize: ScreenUtil().setSp(13.0),
                        ),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "완료",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: notoSans,
                        fontSize: ScreenUtil().setSp(13.0)
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: ScreenUtil().setWidth(48),
                    height: ScreenUtil().setHeight(39),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                            Radius.circular(10)
                        ),
                        color: Colors.white
                    ),
                    child: Text(
                      "N건",
                      style: TextStyle(
                        color:  const Color(0xfffb9905),
                        fontWeight: FontWeight.bold,
                        fontFamily: notoSans,
                        fontSize: ScreenUtil().setSp(13.0),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _cheeringTexts(){
    return Column(
      children: [
        _subTitle("선배들의 응원메세지", false),
      ],
    );
  }

  Widget _divider(){
    return Divider(
      color: const Color(0xfff2f2f2),
      thickness: 6,
      height: ScreenUtil().setHeight(52), //테스트 확인 공식 문서도 확인 필요
    );
  }

  Widget _subTitle(String text, bool needBtn){
    if(needBtn){
      return Padding(
        padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: profileSubTitleTextStyle,
            ),
            Icon(
              Icons.keyboard_arrow_right_rounded,
              color: const Color(0xff323232),
            ),
          ],
        ),
      );
    }else{
      return  Padding(
        padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(20)),
        child: Row(
          children: [
            Text(
              text,
              style: profileSubTitleTextStyle,
            ),
          ],
        ),
      );
    }
  }

  List<Widget> _getKeywords(List<String> list){
    return List<Widget>.generate(
        list.length, (index) {
      return Chip(label: Text(list[index]));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "프로필",
            style: appBarTitleDarkTextStyle,
          ),
          leading: IconButton(
            icon: const Icon(Icons.clear),
            tooltip: '끄기',
            color: Colors.black,
            onPressed: () {  },
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.settings_outlined),
              onPressed: (){},
            ),
          ],
        ),
        body: ListView(
          children: [
            _profileSummary(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(horizontalPadding)),
              child: _level(),
            ),
            _divider(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(horizontalPadding)),
              child: _interestKeywords(context),
            ),
            _divider(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(horizontalPadding)),
              child: _chatAppointment(),
            ),
            _divider(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(horizontalPadding)),
              child: _cheeringTexts(),
            ),
          ],
        ),
    );
  }
}
