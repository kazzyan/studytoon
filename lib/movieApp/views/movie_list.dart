import 'package:flutter/material.dart';
import 'package:fluttoon/movieApp/constants/text_constants.dart';
import 'package:fluttoon/movieApp/models/movie_model.dart';
import 'package:fluttoon/movieApp/views/movie_detail.dart';

class MovieList extends StatelessWidget {
  final Future<List<MovieModel>> movieList;
  final bool displayTitle;
  final String listIdx;

  const MovieList({
    super.key,
    required this.movieList,
    required this.displayTitle,
    required this.listIdx,
  });

  @override
  Widget build(BuildContext context) {
    double imageWidth = displayTitle ? 120 : 250;
    double imageHeight = displayTitle ? 120 : 200;

    return FutureBuilder(
      future: movieList,
      builder: (context, future) {
        if (future.hasData) {
          return SizedBox(
            height: 200,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: future.data!.length,
              itemBuilder: (context, index) {
                var movie = future.data![index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MovieDetail(
                              movieModel: movie,
                              tag: '$listIdx${movie.id}',
                            ),
                          ),
                        );
                      },
                      child: Hero(
                        tag: '$listIdx${movie.id}',
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            '${TextConstants.imageUrl}${movie.poster_path}',
                            width: imageWidth,
                            height: imageHeight,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    displayTitle
                        ? Container(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            width: 120,
                            child: Text(
                              movie.title,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                                //overflow: TextOverflow.ellipsis,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          )
                        : const SizedBox(),
                  ],
                );
              },
              separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              ),
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator.adaptive(),
        );
      },
    );
  }
}
