import 'package:flutter/material.dart';

// De esta forma se puede hacer la navegacion

/* class _NavigationService { */
/*   final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>(); */
/*  */
/*   Future navigationTo(String routerName) { */
/*     return navigatorKey.currentState!.pushNamed(routerName); */
/*   } */
/*  */
/*   void goBack(String routerName) { */
/*     return navigatorKey.currentState!.pop(); */
/*   } */
/* } */
/*  */
/* final navigationService = new _NavigationService(); */
/*  */

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future navigationTo(String routerName) {
    return navigatorKey.currentState!.pushNamed(routerName);
  }

  void goBack(String routerName) {
    return navigatorKey.currentState!.pop();
  }
}
