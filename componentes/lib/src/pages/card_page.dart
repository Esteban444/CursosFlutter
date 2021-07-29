import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
        ],
      ),
    );
  }

  Widget _cardTipo1() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Column(children: <Widget>[
        ListTile(
          leading: Icon(Icons.photo_album, color: Colors.blue),
          title: Text('Soy el titulo de esta targeta'),
          subtitle: Text(
              'Soy una targeta asi es como se hace el codigo en flutter para generar una targeta. '),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
          TextButton(
            child: Text('Cancelar'),
            onPressed: () {},
          ),
          TextButton(
            child: Text('Ok'),
            onPressed: () {},
          )
        ])
      ]),
    );
  }

  Widget _cardTipo2() {
    final card = Container(
        //clipBehavior: Clip.antiAlias,
        child: Column(
      children: <Widget>[
        FadeInImage(
            image: NetworkImage('https://wallpaperaccess.com/full/24243.jpg'),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 300.0,
            fit: BoxFit.cover),
        /* Image( */
        /*   image: NetworkImage('https://wallpaperaccess.com/full/24243.jpg'), */
        /* ), */
        Container(
            padding: EdgeInsets.all(10.0),
            child: Text('No tengo idea de que poner aca'))
      ],
    ));
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                spreadRadius: 2.0,
                offset: Offset(2.0, 10.0)),
          ]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: card,
      ),
    );
  }
}
