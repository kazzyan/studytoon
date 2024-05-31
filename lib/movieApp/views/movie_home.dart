import 'package:flutter/material.dart';
import 'package:fluttoon/movieApp/apis/movie_api.dart';
import 'package:fluttoon/movieApp/models/movie_model.dart';
import 'package:fluttoon/movieApp/views/movie_list.dart';

class MovieHome extends StatelessWidget {
  MovieHome({super.key});

  final Future<List<MovieModel>> _popularMovieList = MovieApi.getPopularList();
  final Future<List<MovieModel>> _nowMovieList = MovieApi.getNowList();
  final Future<List<MovieModel>> _comingMovieList = MovieApi.getComingList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              const Text(
                'Popular Movies',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              MovieList(
                movieList: _popularMovieList,
                displayTitle: false,
                listIdx: 'pop',
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                'Now in Cinemas',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              MovieList(
                movieList: _nowMovieList,
                displayTitle: true,
                listIdx: 'now',
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Coming soon',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              MovieList(
                movieList: _comingMovieList,
                displayTitle: true,
                listIdx: 'com',
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
