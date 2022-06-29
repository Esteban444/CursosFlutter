// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:shoppinglist/MainScreens/Login/loginScreen.dart';
import 'package:shoppinglist/MainScreens/Login/signUp.dart';
import 'package:shoppinglist/Utils/TextApp.dart';
import 'package:shoppinglist/Widgets/Components/Buttons/myLoginButton.dart';
import 'package:shoppinglist/Widgets/Design/DesignWidgets.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

Widget _signUpButton(BuildContext context) {
  // ignore: sized_box_for_whitespace
  return Container(
    width: double.infinity,
    child: OutlineButton(
      borderSide: const BorderSide(color: Colors.white),
      highlightedBorderColor: Theme.of(context).primaryColorLight,
      padding: const EdgeInsets.all(15.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      onPressed: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => SignUp())),
      child: const Text(
        TextApp.SINGUP,
        style: TextStyle(fontSize: 18, color: Colors.white),
      ),
    ),
  );
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          //scroll, debido a que en dispositivos pequeños puede no verse el contenido.
          body: SingleChildScrollView(
        child: Container(
          //respeta un padding|margen en el lateral.
          padding: const EdgeInsets.symmetric(horizontal: 20),
          //cogemos el alto de la pantalla del dispositivo.
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: DesignWidgets.linearGradientMain(context),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DesignWidgets.tittleCustom(),
              MyLoginButton(
                text: TextApp.LOGIN,
                colorText: Theme.of(context).primaryColor,
                colorButtonBackground: Colors.white,
                widgetToNavigate: const LoginScreen(),
              ),
              _signUpButton(context)
            ],
          ),
        ),
      )),
    );
  }
}
