import 'package:flutter/material.dart';

class MessageScreens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments ?? 'No data';

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Message'),
      ),
      body: Center(
        child: Text('$args', style: TextStyle(fontSize: 30)),
      ),
    );
  }
}
