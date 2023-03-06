import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/repository/repository.dart';
import 'package:movie_app/utils/app_error.dart';
import 'package:movie_app/utils/trend_type.dart';

class TmdbGetxController extends GetxController with StateMixin {
  final Repository repository;
  final Map<TrendType, RxList<MovieModel>> movies = {
    TrendType.popular: <MovieModel>[].obs,
    TrendType.topRated: <MovieModel>[].obs,
    TrendType.upcoming: <MovieModel>[].obs,
    TrendType.nowPlaying: <MovieModel>[].obs,
  };

  TmdbGetxController(this.repository);

  void getMovies(TrendType type, BuildContext context) async {
    change(movies[type], status: RxStatus.loading());
    await repository.getMovies(type).then((response) {
      response.fold((l) {
        const AppError()
            .showSnackbar(SnackBar(content: Text('${l.message}')), context);
        change(movies[type], status: RxStatus.error());
      }, (r) {
        movies[type]?.value = r;
        change(movies[type], status: RxStatus.success());
      });
    });
  }
}
