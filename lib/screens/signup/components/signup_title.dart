import 'package:flutter/material.dart';
import 'package:lighthouse/utilities/styles.dart';

class SignUpTitle extends StatelessWidget {
  final String title, subTitle;

  const SignUpTitle({
    Key key,
    @required this.title,
    this.subTitle,
  }) : super(key: key);

  Padding getPadding(){
    if(subTitle == null){
      return Padding(
        padding: const EdgeInsets.only(bottom: 60),
      );
    }else{
      return Padding(
        padding: const EdgeInsets.only(bottom: 44),
        child: SizedBox(
          width: double.infinity,
          child: Text(
            subTitle,
            style: signUpSubTitleStyle,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 70, left: 36, right: 36),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: SizedBox(
              width: double.infinity,
              child: Text(
                title,
                style: signUpTitleStyle,
              ),
            ),
          ),
          getPadding(),
        ],
      ),
    );
  }
}
