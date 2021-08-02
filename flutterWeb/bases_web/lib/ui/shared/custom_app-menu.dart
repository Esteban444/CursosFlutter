import 'package:flutter/material.dart';

import 'package:bases_web/ui/shared/custom_flat_button.dart';
import 'package:bases_web/services/navigation_service.dart';

import '../../locator.dart';

class CustomAppMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        return (constraints.maxWidth > 520)
            ? _TableDeskTopMenu()
            : _MobileMenu();
      },
    );
  }
}

class _TableDeskTopMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: double.infinity,
      //height: 50,
      child: Row(
        children: [
          CustomFlatButton(
              text: 'Contador Stateful',
              //onPressed: () => Navigator.pushNamed(context, '/stateful'),

              // La siguiente linea es para la navegacion  co la parte comentada en navigation_service.
              //onPressed: () => navigationService.navigationTo('/stateful'),

              // la siguiente linea es para manejar rutas con get_it.
              onPressed: () =>
                  locator<NavigationService>().navigationTo('/stateful'),
              color: Colors.black),
          SizedBox(width: 10),
          CustomFlatButton(
              text: 'Contador Provider',
              //onPressed: () => Navigator.pushNamed(context, '/provider'),

              // La siguiente linea es para la navegacion  co la parte comentada en navigation_service.
              // onPressed: () => navigationService.navigationTo('/provider'),

              // la siguiente linea es para manejar rutas con get_it.
              onPressed: () =>
                  locator<NavigationService>().navigationTo('/provider'),
              color: Colors.black),
          SizedBox(width: 10),
          CustomFlatButton(
              text: 'Otra Pagina',
              //onPressed: () => Navigator.pushNamed(context, '/abc444'),

              // La siguiente linea es para la navegacion  co la parte comentada en navigation_service.
              //onPressed: () => navigationService.navigationTo('/abc444'),

              // la siguiente linea es para manejar rutas con get_it.
              onPressed: () =>
                  locator<NavigationService>().navigationTo('/abc444'),
              color: Colors.black)
        ],
      ),
    );
  }
}

class _MobileMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: double.infinity,
      //height: 50,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomFlatButton(
              text: 'Contador Stateful',
              //onPressed: () => Navigator.pushNamed(context, '/stateful'),

              // La siguiente linea es para la navegacion  co la parte comentada en navigation_service.
              //onPressed: () => navigationService.navigationTo('/stateful'),

              // la siguiente linea es para manejar rutas con get_it.
              onPressed: () =>
                  locator<NavigationService>().navigationTo('/stateful'),
              color: Colors.black),
          SizedBox(width: 10),
          CustomFlatButton(
              text: 'Contador Provider',
              //onPressed: () => Navigator.pushNamed(context, '/provider'),

              // La siguiente linea es para la navegacion  co la parte comentada en navigation_service.
              // onPressed: () => navigationService.navigationTo('/provider'),

              // la siguiente linea es para manejar rutas con get_it.
              onPressed: () =>
                  locator<NavigationService>().navigationTo('/provider'),
              color: Colors.black),
          SizedBox(width: 10),
          CustomFlatButton(
              text: 'Otra Pagina',
              //onPressed: () => Navigator.pushNamed(context, '/abc444'),

              // La siguiente linea es para la navegacion  co la parte comentada en navigation_service.
              //onPressed: () => navigationService.navigationTo('/abc444'),

              // la siguiente linea es para manejar rutas con get_it.
              onPressed: () =>
                  locator<NavigationService>().navigationTo('/abc444'),
              color: Colors.black)
        ],
      ),
    );
  }
}
