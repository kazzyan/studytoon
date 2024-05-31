import 'dart:convert';

import 'package:fluttoon/movieApp/constants/text_constants.dart';
import 'package:fluttoon/movieApp/models/movie_detail_model.dart';
import 'package:fluttoon/movieApp/models/movie_model.dart';
import 'package:http/http.dart' as http;

class MovieApi {
  static Future<List<MovieModel>> getPopularList() async {
    List<MovieModel> movieList = [];

    final uri = Uri.parse('${TextConstants.apiUrl}${TextConstants.popular}');
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final movies = jsonDecode(response.body)['results'];

      for (var movie in movies) {
        final movieModel = MovieModel.fromJson(movie);
        movieList.add(movieModel);
      }

      return movieList;
    }
    throw Error();
  }

  static Future<List<MovieModel>> getNowList() async {
    List<MovieModel> movieList = [];

    final uri = Uri.parse('${TextConstants.apiUrl}${TextConstants.now}');
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final movies = jsonDecode(response.body)['results'];

      for (var movie in movies) {
        final movieModel = MovieModel.fromJson(movie);
        movieList.add(movieModel);
      }

      return movieList;
    }
    throw Error();
  }

  static Future<List<MovieModel>> getComingList() async {
    List<MovieModel> movieList = [];

    final uri = Uri.parse('${TextConstants.apiUrl}${TextConstants.coming}');
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final movies = jsonDecode(response.body)['results'];

      for (var movie in movies) {
        final movieModel = MovieModel.fromJson(movie);
        movieList.add(movieModel);
      }

      return movieList;
    }
    throw Error();
  }

  static Future<MovieDetailModel> getDetail(int id) async {
    final uri = Uri.parse('${TextConstants.apiUrl}${TextConstants.detail}$id');
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final movie = jsonDecode(response.body);
      final movieModel = MovieDetailModel.fromJson(movie);
      print(movieModel.runtime);
      return movieModel;
    }
    throw Error();
  }
}
