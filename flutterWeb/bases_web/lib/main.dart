import 'package:bases_web/locator.dart';
import 'package:flutter/material.dart';

import 'package:bases_web/router/route_generator.dart';
import 'package:bases_web/ui/layout/main_layout_page.dart';

import 'package:bases_web/services/navigation_service.dart';

void main() {
  setupLocator();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'RutasApp',
        initialRoute: '/stateful',
        onGenerateRoute: RouteGenerator.generateRoute, // para las rutas.

        // La siguiente linea comentada para la navegacion con la parte comentada en navigation service.
        //navigatorKey: navigationService.navigatorKey,

        //La siguiente linea es para manejar la navigacion con get_it.
        navigatorKey: locator<NavigationService>().navigatorKey,
        builder: (_, child) {
          return MainLayoutPage(
            child: child ?? Container(),
          );
        });
  }
}
