import 'package:flutter/material.dart';
import 'package:peliculas/providers/movies_providers.dart';
import 'package:peliculas/search/search_delegate.dart';
import 'package:peliculas/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final moviesProvider=Provider.of<MoviesProvider>(context);
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Cartelera Actual'),
        elevation: 0,
        actions:  [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed:  ()=>showSearch(context: context, delegate: MovieSearchDelegate())
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
        children: [
          CardSwiper(movies: moviesProvider.onDisplayMovies),
          SliderMovie(movies: moviesProvider.popularMovies,
          title: 'Populares',
          onNextPage: ()=> moviesProvider.getPopularMovies(),
          )
        ],
      ),
      )
    );
  }
}