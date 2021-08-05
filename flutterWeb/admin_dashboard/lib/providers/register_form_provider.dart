import 'package:flutter/material.dart';

class RegisterFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  String name = '';
  String email = '';
  String password = '';

  validateForm() {
    if (formKey.currentState!.validate()) {
      print('Form valid ... Login');
      print('$email === $password === $name');
    } else {
      print('Form not valid');
    }
  }
}
