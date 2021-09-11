import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:newsapp/src/services/news_service.dart';

import 'package:newsapp/src/widgets/list_news.dart';

class Tab1Page extends StatefulWidget {
  @override
  _Tab1PageState createState() => _Tab1PageState();
}

class _Tab1PageState extends State<Tab1Page>
    with AutomaticKeepAliveClientMixin {
  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    final headLines = Provider.of<NewsService>(context).headLines;

    return Scaffold(
      body: (headLines.length == 0)
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListNews(headLines),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
