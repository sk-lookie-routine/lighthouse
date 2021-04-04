import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lighthouse/utilities/colors.dart';

class SingleChoice extends StatefulWidget {
  final List<String> myList;
  final EdgeInsets mypadding;
  final Function(String) onSelectionChanged;

  SingleChoice(this.myList, this.mypadding, {this.onSelectionChanged});

  _SingleChoiceState createState() => _SingleChoiceState();
}

class _SingleChoiceState extends State<SingleChoice> {
  String selectedChoice = "";

  _buildChoiceList() {
    List<Widget> choices = [];

    widget.myList.forEach((item) {
      choices.add(ChoiceChip(
        backgroundColor: Colors.white,
        side: BorderSide(color: primaryColor),
        selectedColor: keywordColor,
        padding: widget.mypadding,
        label: Text(
          item,
          style: TextStyle(
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
        selected: selectedChoice == item,
        onSelected: (selected) {
          setState(() {
            selectedChoice = item;
            widget.onSelectionChanged(selectedChoice);
          });
        },
      ));
    });
    return choices;
  }

  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: _buildChoiceList(),
    );
  }
}
