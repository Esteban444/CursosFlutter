import 'package:flutter/material.dart';

import 'package:bases_web/ui/shared/custom_app-menu.dart';

class MainLayoutPage extends StatelessWidget {
  final Widget child;

  const MainLayoutPage({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            CustomAppMenu(),
            Spacer(),
            // View
            Expanded(child: child),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
