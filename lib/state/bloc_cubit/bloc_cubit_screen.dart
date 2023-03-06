import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/state/bloc_cubit/cubit/get_movies_cubit.dart';
import 'package:movie_app/state/bloc_cubit/get_it.dart';
import 'package:movie_app/utils/trend_type.dart';
import 'package:movie_app/widgets/movie_card.dart';

class BlocCubitScreen extends StatefulWidget {
  const BlocCubitScreen({super.key});

  @override
  State<BlocCubitScreen> createState() => _BlocCubitScreenState();
}

class _BlocCubitScreenState extends State<BlocCubitScreen> {
  late GetMoviesCubit getMoviesCubit;

  final Map<TrendType, List<MovieModel>> movies = {
    TrendType.popular: [],
    TrendType.topRated: [],
    TrendType.upcoming: [],
    TrendType.nowPlaying: [],
  };

  @override
  void initState() {
    super.initState();
    getMoviesCubit = getItInstance<GetMoviesCubit>();
    for (var type in TrendType.values) {
      getMoviesCubit.getMovies(type, context);
    }
  }

  @override
  void dispose() {
    super.dispose();
    getMoviesCubit.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => getMoviesCubit,
        child: Scaffold(
            appBar: AppBar(
              title: const Center(child: Text('Bloc Cubit')),
              backgroundColor: Colors.blue.withOpacity(0.5),
            ),
            body: BlocBuilder<GetMoviesCubit, GetMoviesState>(
                builder: (context, state) {
              if (state is GetMoviesLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is GetMoviesLoaded) {
                List<Widget> listViews = [];
                for (var type in TrendType.values) {
                  listViews.add(
                    Column(
                      children: [
                        ListTile(title: Text(type.value.toUpperCase())),
                        SizedBox(
                          height: 200, // set a specific height
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: state.movies[type]?.length ?? 0,
                            itemBuilder: (context, index) {
                              return MovieCard(
                                posterPath:
                                    state.movies[type]![index].posterPath!,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return ListView(
                  children: listViews,
                );
              } else if (state is GetMoviesError) {
                return Center(child: Text(state.error.toString()));
              }
              return const SizedBox.shrink();
            })));
  }
}
