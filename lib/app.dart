import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lighthouse/screens/welcome/welcome_screen.dart';

class App extends StatelessWidget {
  get logout => null;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context,snapshot){
        if(snapshot.hasError){
          return Center(
            child: Text('Firebase load fail'),
          );
        }
        if(snapshot.connectionState == ConnectionState.done){
          return Scaffold(
            body: StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (BuildContext context, AsyncSnapshot<User> snapshot){
                if(!snapshot.hasData){
                  return WelcomeScreen();
                }else{  //계정 이미 있음
                  return Scaffold();
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