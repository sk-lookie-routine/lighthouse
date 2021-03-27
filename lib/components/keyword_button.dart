import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class KeyWordButton extends StatelessWidget {
  final String text;
  final bool selected;
  final Color selectedColor;
  final Function onSelected;

  const KeyWordButton({
    Key key,
    @required this.text,
    @required this.onSelected,
    @required this.selected,
    @required this.selectedColor,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return ChoiceChip(
        padding: EdgeInsets.all(2.0),
        label: Container(
          width: 90,
          child: Text(
            text,
            style: TextStyle(color: Colors.black),
            textAlign: TextAlign.center,
          ),
        ),
        selected: selected,
        selectedColor: selectedColor,
        onSelected: onSelected);
  }
}
