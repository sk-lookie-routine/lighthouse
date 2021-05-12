import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthService {
  FirebaseAuth auth = FirebaseAuth.instance;

  Stream<User> get authStateChanges => auth.authStateChanges();

  Future<String> signIn(String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email,
          password: password
      );
      return "회원가입 완료";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String> signUp(String email, String password) async {
    try{
      await auth.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      return "로그인 완료";
    }on FirebaseAuthException catch(e) {
      return e.message;
    }
  }
}