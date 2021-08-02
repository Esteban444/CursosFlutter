import 'package:flutter/material.dart';

class CustomFlatButton extends StatelessWidget {
  final String text;
  final Color color;
  final Function onPressed;

  const CustomFlatButton(
      {Key? key,
      required this.text,
      this.color = Colors.pink, // color por defecto.
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(primary: color),
      child: Padding(padding: EdgeInsets.all(10.0), child: Text(this.text)),
      onPressed: () => this.onPressed(),
    );
  }
}
