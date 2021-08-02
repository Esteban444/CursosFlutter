import 'package:fluro/fluro.dart';

import 'package:bases_web/ui/views/counter_provider_view.dart';
import 'package:bases_web/ui/views/counter_view.dart';
import 'package:bases_web/ui/views/view_404.dart';

//Handlers

final counterHandler = Handler(
    handlerFunc: (contex, params) => CounterView(
          base: params['base']?.first ?? '5',
        ));

final counterProviderHandler = Handler(handlerFunc: (contex, params) {
  return CounterProviderView(
    base: params['q']?.first ?? '10',
  );
});

final dasbboardUserHandler = Handler(handlerFunc: (contex, params) {
  print(params);
  return View404();
});

// 404
final pageNotFound = Handler(handlerFunc: (contex, params) => View404());
