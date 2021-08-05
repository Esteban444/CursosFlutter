import 'package:flutter/material.dart';

import 'package:admin_dashboard/ui/buttons/LinkText.dart';

class LinkBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        color: Colors.black,
        height: (size.width > 1000) ? size.height * 0.07 : null,
        child: Wrap(
          alignment: WrapAlignment.center,
          children: [
            LinkText(text: 'About'),
            LinkText(text: 'Help Center'),
            LinkText(text: 'Terms ot Service'),
            LinkText(text: 'Privacy Policy'),
            LinkText(text: 'Cookie Policy'),
            LinkText(text: 'Ads Info'),
            LinkText(text: 'Blog'),
            LinkText(text: 'Status'),
            LinkText(text: 'Careers'),
            LinkText(text: 'Brand Resources'),
            LinkText(text: 'Advertising'),
            LinkText(text: 'Marketing'),
          ],
        ));
  }
}