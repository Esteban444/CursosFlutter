import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert page'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Mostrar alerta'),
          style: ElevatedButton.styleFrom(
            primary: Colors.blue,
            shape: StadiumBorder(),
          ),
          onPressed: () => _mostrarAlerta(context),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_location),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  void _mostrarAlerta(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            title: Text('Titulo'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('Este es el contenido de la caja de la alerta'),
                FlutterLogo(size: 100.0)
              ],
            ),
            actions: <Widget>[
              ElevatedButton(
                child: Text('Cancelar'),
                onPressed: () => Navigator.of(context).pop(), // Se hace asi
              ),
              ElevatedButton(
                child: Text('Ok'),
                onPressed: () {
                  Navigator.of(context)
                      .pop(); // O tambien se puede hacer asi de esta forma.
                },
              ),
            ],
          );
        });
  }
}
