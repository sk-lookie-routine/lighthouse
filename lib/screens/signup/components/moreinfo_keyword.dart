import 'package:flutter/cupertino.dart';
import 'package:lighthouse/screens/signup/components/single_choice.dart';
import 'package:lighthouse/utilities/styles.dart';

class KeyWordInfo extends StatefulWidget {
  _KeyWordInfoState createState() => _KeyWordInfoState();
  List<String> myList;
  final EdgeInsets mypadding;
  KeyWordInfo(this.myList, this.mypadding);
}

class _KeyWordInfoState extends State<KeyWordInfo> {
  String selectedMyList;
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Text(
          '학년',
          style: moreInfoSubText,
        ),
        SingleChoice(
          widget.myList,
          widget.mypadding,
          onSelectionChanged: (selectedList) {
            setState(() {
              selectedMyList = selectedList;
            });
          },
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 100),
        ),
      ],
    );
  }
}
