import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService extends ChangeNotifier {

  final String _baseUrl = 'identitytoolkit.googleapis.com';
  final String _firebaseToken = 'AIzaSyBcXiax1-W4q14KUOliXseJhYzz6Mq86_c';

  // para instancia del secuirity storage para el token

  final storage = new FlutterSecureStorage();

  //si retornamos algo es un error si no todo bien.

  Future<String?> createUser(String email, String password) async { // metodo para el registro.

    final Map<String , dynamic> authData = {

      'email': email,
      'password': password,
      'returnSecureToken': true

    };

    final url = Uri.https(_baseUrl, '/v1/accounts:signUp',{
    'key': _firebaseToken});

    final resp = await http.post(url, body: json.encode(authData) );
    final Map<String,dynamic> decodeResp = json.decode(resp.body);

    if(decodeResp.containsKey('idToken')){
      
      await storage.write(key: 'token', value: decodeResp['idToken']);// para grabar el token.
      
      return null;
    }else{
       return decodeResp['error']['message'];
    }

  }

  Future<String?> login(String email, String password) async { //Metodo para el login

    final Map<String , dynamic> authData = {

      'email': email,
      'password': password,
      'returnSecureToken': true

    };

    final url = Uri.https(_baseUrl, '/v1/accounts:signInWithPassword',{
    'key': _firebaseToken});

    final resp = await http.post(url, body: json.encode(authData) );
    final Map<String,dynamic> decodeResp = json.decode(resp.body);

    if(decodeResp.containsKey('idToken')){

      await storage.write(key: 'token', value: decodeResp['idToken']); // para grabar el token.
      return null;
    }else{
       return decodeResp['error']['message'];
    }

  }

  Future logout() async{
     await storage.delete(key: 'token');
     return;
  }
   // validar token.
  Future<String> readToken() async {

    return await storage.read(key: 'token') ?? ''; // si es nulo regresa string vacio.
  }

}