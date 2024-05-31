class MovieModel {
  final dynamic adult,
      backdrop_path,
      genre_ids,
      id,
      original_language,
      original_title,
      overview,
      popularity,
      poster_path,
      release_date,
      title,
      video,
      vote_average,
      vote_count;

  MovieModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        original_title = json['original_title'],
        poster_path = json['poster_path'],
        vote_average = json['vote_average'],
        vote_count = json['vote_count'],
        release_date = json['release_date'],
        genre_ids = json['genre_ids'],
        backdrop_path = json['backdrop_path'],
        original_language = json['original_language'],
        popularity = json['popularity'],
        title = json['title'],
        video = json['video'],
        adult = json['adult'],
        overview = json['overview'];
}
