import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyFieldForm extends StatelessWidget {
  final String tittle;
  final bool isPassword;

  const MyFieldForm({Key? key, required this.tittle, this.isPassword = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            tittle,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: TextField(
                obscureText: isPassword,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    fillColor: Color(0xfff3f3f4),
                    filled: true)),
          )
        ],
      ),
    );
  }
}
