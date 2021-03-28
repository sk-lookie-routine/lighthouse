import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SingleChoice extends StatefulWidget {
  final List<String> myList;
  final double chipwidth;
  final Function(String) onSelectionChanged;

  SingleChoice(this.myList, this.chipwidth, {this.onSelectionChanged});

  _SingleChoiceState createState() => _SingleChoiceState();
}

class _SingleChoiceState extends State<SingleChoice> {
  String selectedChoice = "";

  double chipwidth;
  _buildChoiceList() {
    List<Widget> choices = [];

    widget.myList.forEach((item) {
      choices.add(ChoiceChip(
        padding: EdgeInsets.symmetric(vertical: 8),
        backgroundColor: Colors.white,
        side: BorderSide(color: const Color(0xffd9d9d9)),
        label: Container(
          width: widget.chipwidth,
          height: 26,
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
