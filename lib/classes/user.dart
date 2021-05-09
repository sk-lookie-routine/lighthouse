
import '../utilities/variables.dart';
import 'level_info.dart';
/*
닉네임
등급
관심 키워드
성별
학교
 */
class User {
  String nickname;
  LevelInfo levelInfo = LevelInfo();
  Map<String, bool> keywords = {
    Keywords.academic[0]: false,
    Keywords.academic[1]: false,
    Keywords.academic[2]: false,
    Keywords.lifeManagement[0]: false,
    Keywords.lifeManagement[1]: false,
    Keywords.lifeManagement[2]: false,
    Keywords.lifeManagement[3]: false,
    Keywords.lifeManagement[4]: false,
    Keywords.major[0]: false,
    Keywords.major[1]: false,
    Keywords.major[2]: false,
    Keywords.major[3]: false,
  };

  Gender gender;
  String school;
  String grade;


  User({
    this.nickname,
    this.gender,
    this.grade,
    this.school,
  });
}
