import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:vertical_lading_page/providers/page_provider.dart';

import 'package:vertical_lading_page/ui/shared/custom_menu.dart';

import 'package:vertical_lading_page/ui/views/about_view%20.dart';
import 'package:vertical_lading_page/ui/views/contact_view.dart';
import 'package:vertical_lading_page/ui/views/location_view.dart';
import 'package:vertical_lading_page/ui/views/home_view.dart';
import 'package:vertical_lading_page/ui/views/pricing_view.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: buildBoxDecoration(),
          child: Stack(
            children: [
              _HomeBody(),
              Positioned(right: 20, top: 20, child: CustomAppMenu())
            ],
          )),
    );
  }

  BoxDecoration buildBoxDecoration() {
    return BoxDecoration(
        gradient: LinearGradient(
            colors: [
              Colors.pink,
              Colors.purple,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.5, 0.5]));
  }
}

class _HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pageProvider = Provider.of<PageProvider>(context, listen: false);

    return PageView(
      controller: pageProvider.scrollController,
      scrollDirection: Axis.vertical,
      children: [
        HomeView(),
        AboutView(),
        ContactView(),
        LocationView(),
        PricingView(),
      ],
    );
  }
}
