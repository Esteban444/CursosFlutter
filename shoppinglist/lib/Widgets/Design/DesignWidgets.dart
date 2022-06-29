// ignore: file_names
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DesignWidgets {
  //Gradient
  static LinearGradient linearGradientMain(BuildContext context) {
    return LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Theme.of(context).primaryColorLight,
          Theme.of(context).primaryColor
        ]);
  }

  //Tittle custom
  static RichText tittleCustom() {
    return RichText(
      textAlign: TextAlign.center,
      text: const TextSpan(text: 'Shopping',
          //style: GoogleFonts.portLligatSans(
          // fontSize: 30, fontWeight: FontWeight.w700, color: Colors.white60),
          children: [
            TextSpan(
                text: "List",
                style: TextStyle(color: Colors.white, fontSize: 30)),
          ]),
    );
  }

  //Tittle custom Dark
  static RichText tittleCustomDark() {
    return RichText(
      textAlign: TextAlign.center,
      text: const TextSpan(text: 'Shopping',
          //style: GoogleFonts.portLligatSans(
          //  fontSize: 30, fontWeight: FontWeight.w700, color: Colors.grey),
          children: [
            TextSpan(
                text: "List",
                style: TextStyle(color: Colors.black, fontSize: 30)),
          ]),
    );
  }
}
