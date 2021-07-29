import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peliculasapp/models/models.dart';

class MoviesProvider extends ChangeNotifier {
  String _apiKey = '84b82bf22f46ebb2e42623ed5651f232';
  String _baseUrl = 'api.themoviedb.org';
  String _languge = 'es-ES';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];

  Map<int, List<Cast>> moviesCast = {};

  int _popularPage = 0;

  MoviesProvider() {
    print('MoviesProvider inicializado');
    this.getOnDisplayMovies();
    this.getPopularMovies();
  }

  Future<String> getJsonData(String endpoint, [int page = 1]) async {
    var url = Uri.https(_baseUrl, endpoint,
        {'api_key': _apiKey, 'language': _languge, 'page': '$page'});

    final response = await http.get(url);
    return response.body;
  }

  getOnDisplayMovies() async {
    final jsonData = await this.getJsonData('3/movie/now_playing');

    final nowplayingResponse = NowPlayingResponse.fromJson(jsonData);
    //print(nowplayingResponse.results[0].title);
    onDisplayMovies = nowplayingResponse.results;
    notifyListeners();
  }

  getPopularMovies() async {
    _popularPage++;

    final jsonData = await this.getJsonData('3/movie/popular', _popularPage);

    final popularResponse = PopularResponse.fromJson(jsonData);

    popularMovies = [
      ...popularMovies,
      ...popularResponse.results
    ]; // los tres puntos es para desestructurar
    notifyListeners();
  }

  Future<List<Cast>> getMovieCast(int movieId) async {
    if (moviesCast.containsKey(movieId)) return moviesCast[movieId]!;

    final jsonData = await this.getJsonData('3/movie/$movieId/credits');

    final creditsResponse = CreditsResponse.fromJson(jsonData);
    moviesCast[movieId] = creditsResponse.cast;
    return creditsResponse.cast;
  }
}
