import 'package:flutter/material.dart';

// para las notificiones del login y register.

class NotificationsService {

  static GlobalKey<ScaffoldMessengerState> messengerkey = new GlobalKey<ScaffoldMessengerState>();

  static showSnackbar(String message) {

    final snackBar = new SnackBar(
      content: Text(message, style: TextStyle(color: Colors.white, fontSize: 18),)
    );
    messengerkey.currentState!.showSnackBar(snackBar);
  } 
}