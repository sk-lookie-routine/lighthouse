import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class KeyWordButton extends StatelessWidget {
  final String text;
  final bool selected;
  final Color selectedColor;
  final Function onSelected;
  final double width;

  const KeyWordButton({
    Key key,
    @required this.text,
    @required this.width,
    @required this.onSelected,
    @required this.selected,
    @required this.selectedColor,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return ChoiceChip(
        padding: EdgeInsets.all(2.0),
        backgroundColor: Colors.white,
        side: BorderSide(color: const Color(0xffd9d9d9)),
        label: Container(
          width: width,
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
            child: Text(
              text,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ),
        selected: selected,
        selectedColor: selectedColor,
        onSelected: onSelected);
  }
}
