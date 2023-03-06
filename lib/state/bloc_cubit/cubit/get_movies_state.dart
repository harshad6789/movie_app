part of 'get_movies_cubit.dart';

abstract class GetMoviesState extends Equatable {
  const GetMoviesState();

  @override
  List<Object> get props => [];
}

class GetMoviesInitial extends GetMoviesState {}

class GetMoviesLoading extends GetMoviesState {}

class GetMoviesLoaded extends GetMoviesState {
  final Map<TrendType, List<MovieModel>> movies;

  const GetMoviesLoaded(this.movies);

  @override
  List<Object> get props => [movies];
}

class GetMoviesError extends GetMoviesState {
  final AppError error;

  const GetMoviesError(this.error);
}
