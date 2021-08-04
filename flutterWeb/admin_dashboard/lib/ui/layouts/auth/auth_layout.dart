import 'package:flutter/material.dart';

class AuthLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        // Desktop
        _DesktopBody(),
        // Mobile

        // LinksBar
      ],
    ));
  }
}

class _DesktopBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height,
      color: Colors.red,
      child: Row(
        children: [
          // Twiter Backgraundle
          Expanded(
            child: Container(
              color: Colors.green,
            ),
          ),
          // view container
          Container(
            width: 600,
            height: double.infinity,
          ),
        ],
      ),
    );
  }
}
