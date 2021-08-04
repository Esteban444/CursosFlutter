import 'package:fluro/fluro.dart';
import 'package:vertical_lading_page/router/route_handlers.dart';

class Flurorouter {
  static final FluroRouter router = new FluroRouter();

  static void configureRoutes() {
    router.define('/:page', handler: homeHandler);

    //404
    router.notFoundHandler = homeHandler;
  }
}
