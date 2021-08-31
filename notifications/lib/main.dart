import 'package:flutter/material.dart';

import 'package:notifications/screens/home_screen.dart';
import 'package:notifications/screens/message_screen.dart';
import 'package:notifications/services/push_notifications_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PushNotificationsService.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> navigatorkey =
      new GlobalKey<NavigatorState>();
  final GlobalKey<ScaffoldMessengerState> messengerkey =
      new GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    super.initState();

    PushNotificationsService.messagesStream.listen((message) {
      print('MyApp: $message');

      navigatorkey.currentState?.pushNamed('message', arguments: message);

      final snackBar = SnackBar(content: Text(message));
      messengerkey.currentState?.showSnackBar(snackBar);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Notifications',
      initialRoute: 'home',
      navigatorKey: navigatorkey, //navegar
      scaffoldMessengerKey: messengerkey, // snacks
      routes: {
        'home': (_) => HomeScreens(),
        'message': (_) => MessageScreens(),
      },
    );
  }
}
