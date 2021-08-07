

import 'package:admin_dashboard/services/local_storage.dart';
import 'package:flutter/material.dart';



class AuthProvider extends ChangeNotifier{

 String? _token;

 login(String email, String password){

    // peticion http

    _token = 'idgtwavaabxzjahahg344sf';
    LocalStorage.prefs.setString('token', this._token!);
    
    // navegar as dashboard

    notifyListeners();
 }
}