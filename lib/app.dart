import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lighthouse/screens/signup/screens/nickname_screen.dart';
import 'package:lighthouse/screens/welcome/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text('Firebase load fail'),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
            body: StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
                if (!snapshot.hasData) {
                  //return LetterKeyWords();
                } else {
                  //계정 정보 있음(sign up 과정을 끝냈는지는 알 수 없음)
                  return NickNameScreen();
                }
              },
            ),
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}
