// Archivo creado despues de instalar el get_it para manejo de rutas.

import 'package:get_it/get_it.dart';

import 'package:bases_web/services/navigation_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
}
