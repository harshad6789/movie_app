import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/api/tmdb_client.dart';
import 'package:movie_app/repository/repository.dart';
import 'package:movie_app/state/bloc_cubit/cubit/get_movies_cubit.dart';

final getItInstance = GetIt.I;

Future init() async {
  getItInstance.registerLazySingleton<Dio>(() => Dio());
  getItInstance
      .registerLazySingleton<TmdbClient>(() => TmdbClient(getItInstance()));
  getItInstance
      .registerLazySingleton<Repository>(() => RepositoryImpl(getItInstance()));
  getItInstance.registerFactory(() => GetMoviesCubit(getItInstance()));
}
