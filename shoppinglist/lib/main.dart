import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:splashscreen/splashscreen.dart';
import 'dart:developer' as developer;

import 'MainScreens/Login/welcomeScreen.dart';
import 'Utils/AssetsImages.dart';
import 'Utils/ConstantsApp.dart';
import 'Utils/TextApp.dart';
import 'Widgets/Design/DesignWidgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color(0xff2c2b50),
        primaryColorDark: const Color(0xff050028),
        primaryColorLight: const Color(0xff57547c),
        textTheme: const TextTheme(
            bodyText1: TextStyle(fontSize: 14, color: Colors.white)),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: const Color(0xffedecee)),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //init
  //final Future<FirebaseApp> _initializationFirebase = Firebase.initializeApp();
  // ignore: constant_identifier_names
  static const String TAG = "Main";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder(
          //future: _initializationFirebase,
          builder: (context, snapshot) {
        //check for errorrs.
        if (snapshot.hasError) {
          //add logs.
          developer.log(TAG + ", Firebase init. ERROR");

          //return SnackBar(content: Text("Error inicializando Firebase"));
          //kill app.
          // exit(0);
        } else if (snapshot.connectionState == ConnectionState.done) {
          developer.log(TAG + ", Firebase init. DONE");
          /*LoginGoogleUtils().googleSignIn.isSignedIn().then((value) {
                //a pulir!!!
                if (value != null) {
                  if (value) {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) {
                          return HomeScreen();
                        },
                      ),
                    );
                  } else {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) {
                          return LoginScreen();
                        },
                      ),
                    );
                  }
                } else {
                  developer.log("loginScreen-build()ERROR user viene nulo");
                }
              });*/
          //done
          return SplashScreen(
            seconds: ConstantsAPP.TIME_SPLASH_SCREEN,
            navigateAfterSeconds: const WelcomeScreen(),
            image: AssetsImages.ImageLogo(),
            photoSize: 120,
            loaderColor: Theme.of(context).colorScheme.secondary,
            loadingText: Text(
              TextApp.LOADING,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            gradientBackground: DesignWidgets.linearGradientMain(context),
          );
        }

        return const CircularProgressIndicator();
      }),
    );
  }
}
