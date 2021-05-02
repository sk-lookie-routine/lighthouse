import 'package:lighthouse/entity/level_info.dart';
import '../utilities/variables.dart';
import '../utilities/variables.dart';
import '../utilities/variables.dart';

class User {
  String email;
  String password;
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
   this.email,
   this.password,
   this.nickname,
    this.gender,
    this.grade,
    this.school,
    this.levelInfo,
    this.keywords,
});
}