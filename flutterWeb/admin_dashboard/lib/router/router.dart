import 'package:fluro/fluro.dart';

import 'package:admin_dashboard/router/admin_handlers.dart';
import 'package:admin_dashboard/router/pagina_no%20encontrada_handlers.dart';

class Flurorouter {
  static final FluroRouter router = new FluroRouter();

  static String rootRoute = '/';
  // Auth Router
  static String loginRoute = '/auth/login';
  static String registerRoute = '/auth/register';

  //
  static String dashboardRoute = '/dashboard';

  static void configureRoutes() {
    // Auth Routes
    router.define(rootRoute,
        handler: AdminHandlers.login, transitionType: TransitionType.none);
    router.define(loginRoute,
        handler: AdminHandlers.login, transitionType: TransitionType.none);
    router.define(registerRoute,
        handler: AdminHandlers.register, transitionType: TransitionType.none);

    //404
    router.notFoundHandler = NoPageFoundHandlers.noPageFound;
  }
}