import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;

Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
  print("=====================================================");
  print("googleUser: " + googleUser.toString());
  print("=====================================================");
  // Obtain the auth details from the request
  final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
  // Create a new credential
  final GoogleAuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );
  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}
/*
Future<UserCredential> signInWithKaKao() async {
  final clientState = Uuid().v4();
  print("=====================================================");
  print("clientState: "+clientState.toString());
  print("=====================================================");
  //로그인 요청
  final url = Uri.https('kauth.kakao.com', '/oauth/authorize', {
    'response_type': 'code',
    'client_id': "4e124799dae2b0ff25c2cfac182963ae",
    'response_mode': 'form_post',
    'redirect_uri':
    'https://diagnostic-evergreen-cephalopod.glitch.me/callbacks/kakao/sign_in',
    'state': clientState,
  });
  print("=====================================================");
  print("url: "+url.toString());
  print("=====================================================");
  final result = await FlutterWebAuth.authenticate(
      url: url.toString(),
      callbackUrlScheme: "webauthcallback");

  final body = Uri.parse(result).queryParameters;
  print("=====================================================");
  print("body: "+body.toString());
  print("=====================================================");
  final tokenUrl = Uri.https('kauth.kakao.com', '/oauth/token', {
    'grant_type': 'authorization_code',
    'client_id': "4e124799dae2b0ff25c2cfac182963ae",
    'redirect_uri':
    'https://diagnostic-evergreen-cephalopod.glitch.me/callbacks/kakao/sign_in',
    'code':body["code"],
  });

  var responseTokens = await http.post(tokenUrl.toString());

  Map<String, dynamic> bodys = json.decode(responseTokens.body);
  print("=====================================================");
  print("bodys['access_token']: "+bodys['access_token'].toString());
  print("=====================================================");
  Map<String, String> header = {
    'Authorization': 'Bearer ' + bodys['access_token'],
  };

  var response = await http.post(
      'https://diagnostic-evergreen-cephalopod.glitch.me/callbacks/kakao/token',
      body: {"accessToken": bodys['access_token']});
  print("=====================================================");
  print("response: "+response.toString());
  print("=====================================================");
  return await FirebaseAuth.instance
      .signInWithCustomToken(response.body);
}
*/