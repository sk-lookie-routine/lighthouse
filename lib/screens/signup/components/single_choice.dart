import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SingleChoice extends StatefulWidget {
  final List<String> myList;
  final EdgeInsets mypadding;
  final Function(String) onSelectionChanged;

  SingleChoice(this.myList, this.mypadding, {this.onSelectionChanged});

  _SingleChoiceState createState() => _SingleChoiceState();
}

class _SingleChoiceState extends State<SingleChoice> {
  String selectedChoice = "";

  double chipwidth;
  _buildChoiceList() {
    List<Widget> choices = [];

    widget.myList.forEach((item) {
      choices.add(ChoiceChip(
<<<<<<< HEAD
        backgroundColor: Colors.white,
        side: BorderSide(color: const Color(0xffd9d9d9)),
        padding: widget.mypadding,
        label: Text(
          item,
          style: TextStyle(
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
=======
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
>>>>>>> d88374930662630da723583211e1d90c622ca69d
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
