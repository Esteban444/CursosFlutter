import 'package:flutter/material.dart';

import 'package:disenos_app/src/pages/headers_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Disigns',
      debugShowCheckedModeBanner: false,
      home: HeadersPage()
    );
  }
}



 