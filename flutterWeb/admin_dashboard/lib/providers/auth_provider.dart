

import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/services/local_storage.dart';
import 'package:admin_dashboard/services/navigation_service.dart';
import 'package:flutter/material.dart';

enum AuthStatus{
    checking,
    authenticated,
    notAuthenticated
  }


class AuthProvider extends ChangeNotifier{

  
 String? _token;
 AuthStatus authStatus = AuthStatus.checking;

 AuthProvider(){
   this.isAuthenticated();
 }

 login(String email, String password){

    // peticion http

    _token = 'idgtwavaabxzjahahg344sf';
    LocalStorage.prefs.setString('token', this._token!);
    
    // navegar as dashboard
    authStatus = AuthStatus.authenticated;
    notifyListeners();
  
    NavigationService.replaceTo(Flurorouter.dashboardRoute);
 }

 Future<bool> isAuthenticated() async{

   final token = LocalStorage.prefs.getString('token');

   if( token == null){
     authStatus = AuthStatus.notAuthenticated;
     notifyListeners();
     return false;
   }
    // ir al bakend y comprovar si token es valido.

    await Future.delayed(Duration(milliseconds: 1000));
    authStatus = AuthStatus.authenticated;
    notifyListeners();
   return true;
 }
}