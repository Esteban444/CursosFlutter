import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class AssetsImages {
  static const String path = "assets/images/";

  // ignore: non_constant_identifier_names
  static Image ImageLauncher() {
    return Image.asset("${path}ic_launcher.png");
  }

  // ignore: non_constant_identifier_names
  static Image ImageLogo() {
    return Image.asset("${path}LogoShoppingList.png");
  }
}
