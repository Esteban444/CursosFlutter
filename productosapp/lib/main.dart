import 'package:flutter/material.dart';
import 'package:productosapp/screens/screens.dart';

 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Productos',
      initialRoute: 'home',
      routes: {
       'login': (_) => LoginScreen(),
       'home': (_) => HomeScreen(),
      },
      theme:  ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.grey[350]
      )
    );
  }
}