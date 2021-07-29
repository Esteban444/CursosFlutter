import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:peliculasapp/search/search_delegate.dart';
import 'package:peliculasapp/providers/movies_provider.dart';
import 'package:peliculasapp/Widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Peliculas en cines'),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.search_outlined),
            onPressed: () =>
                showSearch(context: context, delegate: MovieSearchDelegate()),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Targetas principales
            CardSwiper(movies: moviesProvider.onDisplayMovies),

            //slider de peliculas
            MoviSlider(
              movies: moviesProvider.popularMovies, //populares
              title: 'Populares', //opcional
              onNextPage: () => moviesProvider
                  .getPopularMovies(), // para el scroll horizontal
            ),
          ],
        ),
      ),
    );
  }
}
