import 'package:flutter/material.dart';

//등급들
enum Level { bronze, silver, gold }

//성별
enum Gender { male, female }

final Map<Gender, String> genderLabel = {
  Gender.male: "남자",
  Gender.female: "여자",
};

//키워드들
class Keywords {
  static final academic = [
    "공부방법",
    "진로고민",
    "재수/n수",
  ];

  static final lifeManagement = [
    "건강관리",
    "멘탈관리",
    "학교생활",
    "생활패턴",
    "계획관리",
  ];

  static final major = [
    "문과",
    "이과",
    "공과",
    "예체능",
  ];

  static final school = [
    "고등학교",
    "대학교",
    "그 외",
  ];

  static final collegeGrade = [
    "1학년",
    "2학년",
    "3학년",
    "4학년",
    "졸업생",
  ];

  static final highSchoolGrade = [
    "1학년",
    "2학년",
    "3학년",
  ];

  static final otherGrade = [
    "검정고시",
    "재수/n수",
    "반수/편입",
  ];
}

//유효성 관련 문구들
class ValidationTexts {
  //[회원가입] 유효하지 않을 때
  static final String alreadyInUseEmail = "사용중인 아이디입니다";
  static final String unValidEmailType = " 유효하지 않은 이메일 형식입니다.";
  static final String unValidPasswordType = "8~16자의 영문, 숫자, 특수문자만 사용 가능합니다.";
  static final String notSamePassword = "비밀번호가 일치하지 않습니다.";

  //[회원가입] 유효할 때
  static final String validateEmail = "사용 가능한 아이디입니다.";
  static final String validatePassword = "사용 가능한 비밀번호입니다.";

  //[닉네임] 유호하지 않을 때
  static final String alreadyInUseNickname = "사용중인 닉네임입니다.";
  static final String canNotUseSpecialMarkInNickname = "특수문자는 쓸 수 없습니다.";

  //[닉네임] 유효할 때
  static final String validateNickname = "사용 가능한 닉네임입니다.";
}
