// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MySignUpLabelButton extends StatelessWidget {
  final String firstText;
  final String secondText;
  final Color secondTextColor;
  final Widget widgetToNavigate;
  MySignUpLabelButton(
      {required this.firstText,
      required this.secondText,
      required this.secondTextColor,
      required this.widgetToNavigate});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => widgetToNavigate)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            firstText,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              secondText,
              style: TextStyle(
                  color: secondTextColor,
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
