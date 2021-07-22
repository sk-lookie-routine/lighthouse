import 'package:flutter/material.dart';
import 'package:lighthouse/screens/letter/letter_screen.dart';
import 'package:lighthouse/screens/letter/screens/letterbox_screen.dart';
import 'package:lighthouse/screens/profile/profile_screen.dart';
import 'package:lighthouse/screens/signup/screens/finish_screen.dart';
import 'package:lighthouse/screens/welcome/welcome_screen.dart';
import 'package:lighthouse/utilities/colors.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 2;
  BottomNavigationBar _bottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      selectedFontSize: 10,
      unselectedFontSize: 10,
      items: [
        BottomNavigationBarItem(
          icon: Image.asset(
            "assets/icons/navigation/mail.png",
            color:
                _currentIndex == 0 ? primaryColor : bottomNavigationIconColor,
            width: 24,
          ),
          label: "편지",
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            "assets/icons/navigation/chat.png",
            color:
                _currentIndex == 1 ? primaryColor : bottomNavigationIconColor,
            width: 22,
          ),
          label: "채팅",
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            "assets/icons/navigation/home.png",
            color:
                _currentIndex == 2 ? primaryColor : bottomNavigationIconColor,
            width: 22,
          ),
          label: "홈",
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            "assets/icons/navigation/news.png",
            color:
                _currentIndex == 3 ? primaryColor : bottomNavigationIconColor,
            width: 22,
          ),
          label: "뉴스레터",
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            "assets/icons/navigation/test.png",
            color:
                _currentIndex == 4 ? primaryColor : bottomNavigationIconColor,
            width: 20,
          ),
          label: "테스트",
        ),
      ],
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomNavigationBar(),
      body: IndexedStack(
        index: _currentIndex,
        children: <Widget>[
          LetterScreen(),
          WelcomeScreen(),
          LetterScreen(),
          ProfileScreen(),
          LetterBoxScreen(),
        ],
      ),
    );
  }
}
