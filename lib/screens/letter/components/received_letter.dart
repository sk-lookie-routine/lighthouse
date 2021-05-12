import 'package:flutter/material.dart';
import 'package:lighthouse/utilities/colors.dart';
import 'package:lighthouse/utilities/fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lighthouse/utilities/variables.dart';
import 'package:intl/intl.dart';
import '../../../components/containers/squared_letter_keyword.dart';
import '../../../utilities/fonts.dart';

class ReceivedLetter extends StatelessWidget {
  final String nickname;
  final Level level;
  final List<String> keywords;
  final DateTime date;
  final Function onPressed;
  final bool isRead;
  
  ReceivedLetter({
    this.nickname,
    this.level,
    this.keywords,
    this.date,
    this.onPressed,
    this.isRead,
  });

  List<Widget> _getKeywords(List<String> list){
    return List<Widget>.generate(
        list.length, (index) {
          return SquaredLetterKeyword(list[index]);
    });
  }

  String _setLevelText(Level level){
    if(level == Level.gold) return "GOLD";
    else if(level == Level.silver) return "SILVER";
    else if(level == Level.bronze) return "BRONZE";
  }

  Color _getLevelTextColor(Level level){
    if(level == Level.gold) return goldColor;
    else if(level == Level.silver) return silverColor;
    else if(level == Level.bronze) return bronzeColor;
  }

  Image _getImage(bool read){
    if (read){
      return Image.asset(
        "assets/images/letter_read.png",
        width: ScreenUtil().setWidth(38),
      );
    }else{
      return Image.asset(
        "assets/images/letter_new.png",
        width: ScreenUtil().setWidth(38),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Color levelColor = _getLevelTextColor(level);
    String levelText = _setLevelText(level);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _getImage(isRead),
        Container(
          width: ScreenUtil().setWidth(261),
          height: ScreenUtil().setHeight(80),
          color: primaryMoreLightColor,
          padding: EdgeInsets.symmetric(
            vertical: ScreenUtil().setHeight(13),
            horizontal: ScreenUtil().setWidth(14),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        nickname,
                        style: TextStyle(
                          color: Color(0xff575757),
                          fontWeight: FontWeight.bold,
                          fontFamily: notoSans,
                          fontSize: ScreenUtil().setSp(14)
                        ),
                      ),
                      Container(
                        width: 1,
                        height: ScreenUtil().setHeight(13),
                        color: const Color(0xff707070),
                        margin: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setWidth(3.5),
                        ),
                      ),
                      Text(
                        levelText,
                        style: TextStyle(
                          color: levelColor,
                          fontWeight: FontWeight.w500,
                          fontFamily: notoSans,
                          fontSize: ScreenUtil().setSp(14),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    child: Icon(
                        Icons.keyboard_arrow_right_rounded,
                        color: const Color(0xff575757),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: _getKeywords(keywords),
                  ),
                  Text(
                      DateFormat("yyyy.MM.dd").format(date),
                      style: TextStyle(
                          color:  const Color(0xff6f6f6f),
                          fontFamily: notoSans,
                          fontSize: ScreenUtil().setSp(10),
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
}
