import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:shoppinglist/MainScreens/Login/signUp.dart';
import 'package:shoppinglist/MainScreens/homeScreen.dart';
import 'package:shoppinglist/Utils/TextApp.dart';
import 'package:shoppinglist/Widgets/Components/Buttons/myBackButton.dart';
import 'package:shoppinglist/Widgets/Components/Buttons/myLoginButton.dart';
import 'package:shoppinglist/Widgets/Components/Buttons/mySignUpLabelButton.dart';
import 'package:shoppinglist/Widgets/Components/Containers/containerShape01.dart';
import 'package:shoppinglist/Widgets/Components/Fields/myFieldForm.dart';
import 'package:shoppinglist/Widgets/Design/DesignWidgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Widget _emailPasswordWidget() {
    return Column(
      children: const <Widget>[
        MyFieldForm(
          tittle: TextApp.EMAIL_ID,
        ),
        MyFieldForm(tittle: TextApp.PASSWORD, isPassword: true),
      ],
    );
  }

  Widget _forgottenPassword() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      alignment: Alignment.centerRight,
      child: const Text(TextApp.FORGOT_PASSWORD,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
    );
  }

  Widget _divider() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: const <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          Text(TextApp.OR),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
        ],
      ),
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
                    text: TextApp.LOGIN,
                    colorText: Colors.white,
                    colorButtonBackground: Theme.of(context).primaryColor,
                    widgetToNavigate: const HomeScreen(),
                  ),
                  _forgottenPassword(),
                  _divider(),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(top: 10, bottom: 10),
                    child: GoogleSignInButton(
                      centered: true,
                      borderRadius: 5,
                      onPressed: () {
                        /*LoginGoogleUtils().signInWithGoogle().then((user) {
                          //a pulir!!!
                          if (user != null) {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return HomeScreen();
                                },
                              ),
                            );
                          } else {
                            //developer.log(
                            //"loginScreen-build()ERROR user viene nulo");
                          }
                        });*/
                      },
                      darkMode: false,
                      text: TextApp.GOOGLE_SIGN,
                    ),
                  ),
                  MySignUpLabelButton(
                    firstText: TextApp.DONT_HAVE_ACCOUNT,
                    secondText: TextApp.SINGUP,
                    secondTextColor: Theme.of(context).primaryColorDark,
                    widgetToNavigate: const SignUp(),
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
