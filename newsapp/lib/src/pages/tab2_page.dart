import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:newsapp/src/services/news_service.dart';

import 'package:newsapp/src/models/category_model.dart';
import 'package:newsapp/src/theme/tema.dart';
import 'package:newsapp/src/widgets/list_news.dart';

class Tab2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);

    return Container(
      child: Column(
        children: <Widget>[
          _ListCategories(),
          Expanded(
              child: ListNews(newsService.getArticulosCategoriaSeleccionada()!))
        ],
      ),
    );
  }
}

class _ListCategories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<NewsService>(context).categories;

    return Container(
      width: double.infinity,
      height: 120,
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (BuildContext context, int index) {
            final cName = categories[index].name;

            return Container(
              width: 90,
              child: Padding(
                padding: EdgeInsets.only(top: 50),
                child: Column(
                  children: <Widget>[
                    _CategoryBotton(categories[index]),
                    SizedBox(
                      height: 5,
                    ),
                    Text('${cName[0].toUpperCase()}${cName.substring(1)}')
                  ],
                ),
              ),
            );
          }),
    );
  }
}

class _CategoryBotton extends StatelessWidget {
  final Category category;

  const _CategoryBotton(this.category);

  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);

    return GestureDetector(
      onTap: () {
        final newsService = Provider.of<NewsService>(context, listen: false);
        newsService.selectedCategory = category.name;
      },
      child: Container(
        width: 40,
        height: 40,
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        child: Icon(category.icon,
            color: (newsService.selectedCategory == this.category.name)
                ? miTema.accentColor
                : Colors.black54),
      ),
    );
  }
}
