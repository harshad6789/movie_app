import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/repository/repository.dart';
import 'package:movie_app/utils/app_error.dart';
import 'package:movie_app/utils/trend_type.dart';

part 'get_movies_state.dart';

class GetMoviesCubit extends Cubit<GetMoviesState> {
  final Repository repository;
  final Map<TrendType, List<MovieModel>> movies = {
    TrendType.popular: [],
    TrendType.topRated: [],
    TrendType.upcoming: [],
    TrendType.nowPlaying: [],
  };

  GetMoviesCubit(this.repository) : super(GetMoviesInitial());

  void getMovies(TrendType type, BuildContext context) async {
    emit(GetMoviesLoading());
    await repository.getMovies(type).then((response) {
      response.fold(
        (l) {
          const AppError()
              .showSnackbar(SnackBar(content: Text('${l.message}')), context);
          emit(GetMoviesError(l));
        },
        (r) {
          movies[type] = r;
          final Map<TrendType, List<MovieModel>> allMovies = Map.from(movies);
          emit(GetMoviesLoaded(allMovies));
        },
      );
    });
  }
}
