// ignore: file_names
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

_drawerHome(BuildContext context) {
  return Drawer(
    child: ListView(
      children: const [
        //Drawer
        /*DrawerHeader(
            decoration: BoxDecoration(
              gradient: DesignWidgets.linearGradientMain(context),
            ),
            child: CircleAvatar(
                radius: 10,
                child: Image(
                  image: NetworkImage(
                      LoginGoogleUtils().getUserGoogle().photoUrl.toString()),
                ))),
        //cerrar sesión
        ListTile(
          onTap: () => {
            LoginGoogleUtils().signOutGoogle(),
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return LoginScreen();
                },
              ),
            )
          },
          leading: Icon(Icons.logout),
          title: Text(
            TextApp.LOGOUT,
            style: TextStyle(color: Colors.black),
          ),
        ),*/
      ],
    ),
  );
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(), body: const Center(), drawer: _drawerHome(context));
  }
}
