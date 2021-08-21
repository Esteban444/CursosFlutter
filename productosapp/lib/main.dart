import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:productosapp/services/services.dart';

import 'package:productosapp/screens/screens.dart';


 
void main() => runApp(AppState());

class AppState extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider( create: (_) => ProductsService(),)
      ],
      child: MyApp(),
    );
  }
}
 
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
       'product': (_) => ProductScreen(),
      },
      theme:  ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.grey[350],
        appBarTheme: AppBarTheme(
          color: Colors.indigoAccent,
          elevation: 0,
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.indigoAccent,
          elevation: 0
        )
      )
    );
  }
}