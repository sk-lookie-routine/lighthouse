import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lighthouse/components/keyword_button.dart';
import 'package:lighthouse/components/signup_button.dart';
import 'package:lighthouse/screens/signup/components/nickname.dart';
import 'package:lighthouse/utilities/colors.dart';
import 'package:lighthouse/utilities/styles.dart';

class SignUpMoreInfo extends StatefulWidget {
  _SignUpMoreInfoState createState() => _SignUpMoreInfoState();
}

class _SignUpMoreInfoState extends State<SignUpMoreInfo> {
  bool _selected = false;
  void onSelected(bool selected) {
    setState(() {
      _selected = !_selected;
    });
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Text(
                '성별',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                KeyWordButton(
                    text: '여자',
                    onSelected: onSelected,
                    selected: _selected,
                    selectedColor: primaryLightColor),
                KeyWordButton(
                    text: '남자',
                    onSelected: onSelected,
                    selected: _selected,
                    selectedColor: primaryLightColor),
              ],
            ),
            Container(
              child: Text(
                '학교',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                KeyWordButton(
                    text: '고등학교',
                    onSelected: onSelected,
                    selected: _selected,
                    selectedColor: primaryLightColor),
                KeyWordButton(
                    text: '대학교',
                    onSelected: onSelected,
                    selected: _selected,
                    selectedColor: primaryLightColor),
                KeyWordButton(
                    text: '그 외',
                    onSelected: onSelected,
                    selected: _selected,
                    selectedColor: primaryLightColor),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
