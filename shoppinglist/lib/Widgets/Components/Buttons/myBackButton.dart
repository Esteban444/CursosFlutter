// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../../../Utils/TextApp.dart';

// ignore: use_key_in_widget_constructors
class MyBackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () => Navigator.pop(context),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            // ignore: prefer_const_constructors
            Icon(
              Icons.keyboard_arrow_left,
              color: Colors.white,
            ),
            // ignore: prefer_const_constructors
            Text(TextApp.BACK,
                style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.white))
          ],
        ),
      ),
    );
  }
}
