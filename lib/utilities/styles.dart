import 'package:flutter/material.dart';
import 'package:lighthouse/utilities/colors.dart';
import 'package:lighthouse/utilities/fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

var signUpTextFieldTextStyle = TextStyle(
    color: const Color(0xff1b1b1b),
    fontFamily: notoSans,
    fontSize: ScreenUtil().setSp(16));

var appBarTitleDarkTextStyle = TextStyle(
    color:  const Color(0xff161616),
    fontWeight: FontWeight.w500,
    fontFamily: notoSans,
    fontSize: ScreenUtil().setSp(18));

var appBarTitleLightTextStyle = TextStyle(
    color:  const Color(0xffffffff),
    fontWeight: FontWeight.w500,
    fontFamily: notoSans,
    fontSize: ScreenUtil().setSp(18));

var signUpMidTitleTextStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontFamily: notoSans,
    fontSize: ScreenUtil().setSp(14));

var signUpGradeTextStyle = TextStyle(
    color: primaryColor,
    fontWeight: FontWeight.bold,
    fontFamily: notoSans,
    fontSize: ScreenUtil().setSp(14));

var TextFormFieldErrorTextStyle = TextStyle(
    color: const Color(0xffff3120),
    fontFamily: notoSans,
    fontSize: ScreenUtil().setSp(12));

var SignUpMiniTitleTextStyle = TextStyle(
    color:  const Color(0xffb2b2b2),
    fontFamily: notoSans,
    fontSize: ScreenUtil().setSp(10));