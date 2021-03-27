import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lighthouse/components/keyword_button.dart';
import 'package:lighthouse/components/signup_button.dart';
import 'package:lighthouse/screens/signup/components/sign_up_nickname.dart';
import 'package:lighthouse/utilities/colors.dart';
import 'package:lighthouse/utilities/constants.dart';
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
    Size size = MediaQuery.of(context).size;
    List<String> sexList = ["여자", "남자"];
    List<String> schoolList = ["고등학교", "대학교", "그 외"];
    List<String> gradeList = ["1학년", "2학년", "3학년"];
    String selectedsexList;
    double width;
    return SizedBox(
      height: getHeightByScreenSize(size.height, 310),
      child: ListView(
        children: [
          Container(
            child: Text(
              '성별',
              style: moreInfoSubText,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SingleChoice(
                sexList,
                onSelectionChanged: (selectedList) {
                  setState(() {
                    selectedsexList = selectedList;
                  });
                },
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 22),
          ),
          Container(
            child: Text(
              '학교',
              style: moreInfoSubText,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              KeyWordButton(
                text: '고등학교',
                onSelected: onSelected,
                selected: _selected,
                selectedColor: primaryLightColor,
                width: 90,
              ),
              KeyWordButton(
                text: '대학교',
                onSelected: onSelected,
                selected: _selected,
                selectedColor: primaryLightColor,
                width: 90,
              ),
              KeyWordButton(
                text: '그 외',
                onSelected: onSelected,
                selected: _selected,
                selectedColor: primaryLightColor,
                width: 90,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 22),
          ),
          Container(
            child: Text(
              '학년',
              style: moreInfoSubText,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              KeyWordButton(
                text: '1학년',
                onSelected: onSelected,
                selected: _selected,
                selectedColor: primaryLightColor,
                width: 90,
              ),
              KeyWordButton(
                text: '2학년',
                onSelected: onSelected,
                selected: _selected,
                selectedColor: primaryLightColor,
                width: 90,
              ),
              KeyWordButton(
                text: '3학년',
                onSelected: onSelected,
                selected: _selected,
                selectedColor: primaryLightColor,
                width: 90,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SingleChoice extends StatefulWidget {
  final List<String> sexList;
  final Function(String) onSelectionChanged;

  SingleChoice(this.sexList, {this.onSelectionChanged});

  _SingleChoiceState createState() => _SingleChoiceState();
}

class _SingleChoiceState extends State<SingleChoice> {
  String selectedChoice = "";

  double width;
  _buildChoiceList() {
    List<Widget> choices = [];

    widget.sexList.forEach((item) {
      choices.add(Container(
        padding: const EdgeInsets.all(2.0),
        child: ChoiceChip(
          padding: EdgeInsets.all(2.0),
          backgroundColor: Colors.white,
          side: BorderSide(color: const Color(0xffd9d9d9)),
          label: Container(
            width: 134,
            alignment: Alignment.center,
            child: Text(
              item,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          selected: selectedChoice == item,
          onSelected: (selected) {
            setState(() {
              selectedChoice = item;
              widget.onSelectionChanged(selectedChoice);
            });
          },
        ),
      ));
    });
    return choices;
  }

  Widget build(BuildContext context) {
    return Wrap(
      children: _buildChoiceList(),
    );
  }
}
