import 'package:flutter/material.dart';
import 'package:lighthouse/screens/home/home_screen.dart';
import 'package:lighthouse/screens/letter/letter_screen.dart';
import 'package:lighthouse/screens/signin/signin_screen.dart';
import 'package:lighthouse/screens/signup/screens/finish_screen.dart';
import 'package:lighthouse/screens/signup/screens/interests_screen.dart';
import 'package:lighthouse/screens/signup/screens/moreinfo_screen.dart';
import 'package:lighthouse/screens/signup/screens/nickname_screen.dart';
import 'package:lighthouse/screens/signup/signup_screen.dart';
import 'package:lighthouse/screens/welcome/welcome_screen.dart';
import 'package:lighthouse/utilities/colors.dart';
import 'package:lighthouse/utilities/fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lighthouse/utilities/styles.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 760),
      builder: () => MaterialApp(
        builder: (context, child) {
          return MediaQuery(
            child: child,
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          );
        },
        debugShowCheckedModeBanner: false,
        title: 'Light House',
        theme: ThemeData(
          fontFamily: notoSans,
          primaryColor: primaryColor,
          primaryColorLight: primaryLightColor,
          scaffoldBackgroundColor: Colors.white,
          errorColor: errorColor,
          iconTheme: IconThemeData(
            color: primaryColor,
          ),
          appBarTheme: AppBarTheme(
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
          ),
        ),
        home: WelcomeScreen(),
        routes: {
          HomeScreen.id: (context) => HomeScreen(),
          WelcomeScreen.id: (context) => WelcomeScreen(),
          SignInScreen.id: (context) => SignInScreen(),
          SignUpScreen.id: (context) => SignUpScreen(),
          NickNameScreen.id: (context) => NickNameScreen(),
          MoreInfoScreen.id: (context) => MoreInfoScreen(),
          InterestsScreen.id: (context) => InterestsScreen(),
          FinishScreen.id: (context) => FinishScreen(),
          LetterScreen.id: (context) => LetterScreen(),
        },
      ),
    );
  }
}
