
import 'package:shared_preferences/shared_preferences.dart';


class PreferenciasUsuario {
   
  static final PreferenciasUsuario _instancia = new PreferenciasUsuario._internal();
  
  factory PreferenciasUsuario() {
     return _instancia;
  }

  PreferenciasUsuario._internal();

  late SharedPreferences _prefs;

  initPrefs() async{
    _prefs = await SharedPreferences.getInstance();
  }

  // ninguna de estas propiedades se usa
  //late bool _colorSecundario;
  //late int _genero;
  //late String _nombre;

  // get y set del genero

   get genero {
    return _prefs.getInt('genero') ?? 1;
  }

  set setgenero(int value) {
    _prefs.setInt('genero', value);
  }

}