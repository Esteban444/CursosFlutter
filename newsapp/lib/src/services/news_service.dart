import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:newsapp/src/models/category_model.dart';

import 'package:newsapp/src/models/news_models.dart';

final _URL_NEWS = 'https://newsapi.org/v2';

final _APIKEY = '56d4159a55fb46268db4b844413e6e2b';

class NewsService with ChangeNotifier {
  List<Article> headLines = [];
  String _selectedCategory = 'business';

  List<Category> categories = [
    Category(FontAwesomeIcons.building, 'business'),
    Category(FontAwesomeIcons.tv, 'entertainment'),
    Category(FontAwesomeIcons.addressCard, 'general'),
    Category(FontAwesomeIcons.headSideVirus, 'health'),
    Category(FontAwesomeIcons.vials, 'science'),
    Category(FontAwesomeIcons.volleyballBall, 'sports'),
    Category(FontAwesomeIcons.memory, 'technology'),
  ];

  Map<String, List<Article>> categoryArticles = {};

  NewsService() {
    this.getTopHeadlines();

    categories.forEach((item) {
      this.categoryArticles[item.name] = [];
    });
  }

  String get selectedCategory => this._selectedCategory;

  set selectedCategory(String valor) {
    this._selectedCategory = valor;

    this.getArticleByCategory(valor);
    notifyListeners();
  }

  List<Article>? getArticulosCategoriaSeleccionada() =>
      this.categoryArticles[this.selectedCategory];

  getTopHeadlines() async {
    final url =
        Uri.parse('$_URL_NEWS/top-headlines?apiKey=$_APIKEY&country=co');

    final resp = await http.get(url);

    final newsResponse = newsResponseFromJson(resp.body);

    this.headLines.addAll(newsResponse.articles);
    notifyListeners();
  }

  getArticleByCategory(String category) async {
    if (this.categoryArticles[category]!.length > 0) {
      return this.categoryArticles[category];
    }

    final url = Uri.parse(
        '$_URL_NEWS/top-headlines?apiKey=$_APIKEY&country=co&category=$category');

    final resp = await http.get(url);

    final newsResponse = newsResponseFromJson(resp.body);

    this.categoryArticles[category]!.addAll(newsResponse.articles);
    notifyListeners();
  }
}
