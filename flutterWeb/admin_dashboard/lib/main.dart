import 'package:flutter/material.dart';

import 'package:admin_dashboard/router/router.dart';

import 'ui/layouts/auth/auth_layout.dart';

void main() {
  Flurorouter.configureRoutes();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Admin Dashboard',
        initialRoute: '/',
        onGenerateRoute: Flurorouter.router.generator,
        builder: (_, child) {
          return AuthLayout();
        });
  }
}
