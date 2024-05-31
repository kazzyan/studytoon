class MovieDetailModel {
  final dynamic genre, id, runtime;

  MovieDetailModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        genre = json['genre'],
        runtime = json['runtime'];
}
