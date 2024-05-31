import 'package:flutter/material.dart';
import 'package:fluttoon/movieApp/apis/movie_api.dart';
import 'package:fluttoon/movieApp/constants/text_constants.dart';
import 'package:fluttoon/movieApp/models/movie_detail_model.dart';
import 'package:fluttoon/movieApp/models/movie_model.dart';

class MovieDetail extends StatefulWidget {
  final MovieModel movieModel;
  final String tag;

  const MovieDetail({
    super.key,
    required this.movieModel,
    required this.tag,
  });

  @override
  State<MovieDetail> createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  late Future<MovieDetailModel> _movieDetail;

  @override
  void initState() {
    super.initState();
    _movieDetail = MovieApi.getDetail(widget.movieModel.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.chevron_left,
            size: 30,
            color: Colors.white,
          ),
        ),
        title: const Text(
          'Back to list',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Hero(
              tag: widget.tag,
              child: Image.network(
                '${TextConstants.imageUrl}${widget.movieModel.poster_path}',
                fit: BoxFit.fill,
              ),
            ),
          ),
          Column(
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  color: Colors.transparent,
                ),
              ),
              Flexible(
                flex: 2,
                child: Container(
                  color: Colors.transparent,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: FutureBuilder(
                    future: _movieDetail,
                    builder: (context, future) {
                      if (future.hasData) {
                        int hours = future.data!.runtime ~/ 60;
                        var minutes = future.data!.runtime % 60;
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.movieModel.original_title,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  '${hours}h ${minutes}min',
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                const SizedBox(
                                  width: 10,
                                ), /*
                                for (var genre in future.data!.genre) ...[
                                  Text(
                                    genre.toString(),
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                ],*/
                              ],
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            const Text(
                              'Storyline',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              widget.movieModel.overview,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        );
                      }
                      return const Center(
                        child: CircularProgressIndicator.adaptive(),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
