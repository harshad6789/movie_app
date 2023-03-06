import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/state/riverpod/providers.dart';
import 'package:movie_app/utils/trend_type.dart';
import 'package:movie_app/widgets/movie_card.dart';

class RiverpodScreen extends ConsumerWidget {
  const RiverpodScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Riverpod')),
          backgroundColor: const Color(0xFF41d0fd),
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          for (var type in TrendType.values) ...[
            ListTile(title: Text(type.value.toUpperCase())),
            SizedBox(
              height: 200,
              child: ref.watch(getMoviesProvider(type, context)).when(
                    data: (movies) {
                      return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: movies.length,
                          itemBuilder: (context, index) {
                            return MovieCard(
                                posterPath: movies[index].posterPath!);
                          });
                    },
                    error: (error, stackTrace) =>
                        Center(child: Text(error.toString())),
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                  ),
            )
          ]
        ])));
  }
}
