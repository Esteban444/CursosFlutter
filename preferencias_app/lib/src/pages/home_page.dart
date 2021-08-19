import 'package:flutter/material.dart';

import 'package:preferencias_app/src/share-prefs/preferencias_usuario.dart';
import 'package:preferencias_app/src/widgets/menu_widget.dart';




class HomePage extends StatelessWidget {

  static final String routeName = 'home'; //para la ruta.
  final prefs = new PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {

    prefs.ultimaPagina = HomePage.routeName;
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferencias de usuario'),
        backgroundColor: (prefs.colorSecundario) ? Colors.teal : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget> [
          Text('Color Secundario: ${prefs.colorSecundario}'),
          Divider(),
          Text('Genero: ${prefs.genero}'),
          Divider(),
          Text('Nombre de Usuario: ${prefs.nombreUsuario}'),
          Divider()
        ],
      ),
    );
  }

}