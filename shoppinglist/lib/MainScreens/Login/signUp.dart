// ignore: file_names
import 'package:flutter/material.dart';
import 'package:shoppinglist/Utils/TextApp.dart';
import 'package:shoppinglist/Widgets/Components/Buttons/myBackButton.dart';
import 'package:shoppinglist/Widgets/Components/Buttons/myLoginButton.dart';
import 'package:shoppinglist/Widgets/Components/Buttons/mySignUpLabelButton.dart';
import 'package:shoppinglist/Widgets/Components/Containers/containerShape01.dart';
import 'package:shoppinglist/Widgets/Components/Fields/myFieldForm.dart';
import 'package:shoppinglist/Widgets/Design/DesignWidgets.dart';

import 'loginSCreen.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  Widget _emailPasswordWidget() {
    var USER_NAME;
    return Column(
      children: const <Widget>[
        MyFieldForm(tittle: TextApp.USER_NAME),
        MyFieldForm(tittle: TextApp.EMAIL_ID),
        MyFieldForm(tittle: TextApp.PASSWORD, isPassword: true),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          const ContainerShape01(),
          Container(
            height: double.infinity,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: height * .15), //15%
                    child: DesignWidgets.tittleCustomDark(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: height * .05), //5%
                    child: _emailPasswordWidget(),
                  ),
                  MyLoginButton(
                      text: TextApp.SINGUP,
                      colorText: Colors.white,
                      colorButtonBackground: Theme.of(context).primaryColor,
                      widgetToNavigate: LoginScreen()),
                  MySignUpLabelButton(
                    firstText: TextApp.I_HAVE_ACCOUNT,
                    secondText: TextApp.LOGIN,
                    secondTextColor: Theme.of(context).primaryColorDark,
                    widgetToNavigate: LoginScreen(),
                  )
                ],
              ),
            ),
          ),

          Positioned(top: height * .025, child: MyBackButton()), //2,5%
        ],
      ),
    ));
  }
}
