import 'package:flutter/material.dart';
import 'package:lighthouse/utilities/colors.dart';
import 'package:lighthouse/utilities/fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class KeywordsChipGroup extends StatefulWidget {
  final String title;
  final List<String> keywordsList;
  bool isTitleMarked = false;
  final int crossAxisCount;
  double horizontalPadding = null;
  final Function onSelectionChanged;

  KeywordsChipGroup({
    Key key,
    @required this.title,
    @required this.keywordsList,
    @required this.crossAxisCount,
    this.isTitleMarked,
    this.onSelectionChanged,
    this.horizontalPadding,
  }) : super(key: key);

  @override
  _KeywordsChipGroupState createState() => _KeywordsChipGroupState();
}

class _KeywordsChipGroupState extends State<KeywordsChipGroup> {
  String selectedKeywords = "";
  List<String> selectedList = [];
  bool _selected = false;
  BorderSide _borderSide = BorderSide(color: primaryColor);

  Widget _getTitle() {
    return Text(
      widget.title,
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontFamily: notoSans,
        fontSize: ScreenUtil().setSp(14),
      ),
    );
  }

  Widget _buildChip(String label) {
    return ChoiceChip(
      label: Text(
        label,
        style: TextStyle(
          color: Colors.black,
          fontFamily: notoSans,
          fontSize: ScreenUtil().setSp(14),
        ),
        overflow: TextOverflow.visible,
      ),
      pressElevation: 1,
      selected: selectedList.contains(label),
      onSelected: (isSelected) {
        setState(() {
          selectedKeywords = label;
          if (selectedList.contains(selectedKeywords)) {
            selectedList.removeWhere(
                (element) => element.toString() == selectedKeywords);
          } else {
            selectedList.add(selectedKeywords);
          }
          widget.onSelectionChanged(selectedKeywords);
        });
      },
      selectedColor: primaryLightColor,
      backgroundColor: Colors.white,
      padding: EdgeInsets.symmetric(
          horizontal: ScreenUtil().setWidth(widget.horizontalPadding),
          vertical: ScreenUtil().setHeight(7)),
      side: BorderSide(color: const Color(0xffd9d9d9)),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.horizontalPadding == null) widget.horizontalPadding = 10;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.only(
            bottom: ScreenUtil().setHeight(1),
          ),
          child: _getTitle(),
        ),
        SizedBox(
          height: 4,
        ),
        GridView.count(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          childAspectRatio: 2, //????????? ????????????
          crossAxisCount: widget.crossAxisCount,
          children: widget.keywordsList.map((tag) => _buildChip(tag)).toList(),
        ),
      ],
    );
  }
}
