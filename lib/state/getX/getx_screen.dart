import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/state/getX/tmdb_getx_controller.dart';
import 'package:movie_app/utils/trend_type.dart';
import 'package:movie_app/widgets/movie_card.dart';

class GetxScreen extends GetView<TmdbGetxController> {
  const GetxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    for (var type in TrendType.values) {
      controller.getMovies(type, context);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('GetX')),
        backgroundColor: Colors.purple.withOpacity(0.5),
      ),
      body: SingleChildScrollView(
        child: controller.obx(
          (state) => Column(
            children: [
              for (var type in TrendType.values) ...[
                ListTile(title: Text(type.value.toUpperCase())),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.movies[type]?.length,
                    itemBuilder: (context, index) {
                      return MovieCard(
                        posterPath:
                            controller.movies[type]?[index].posterPath ?? '',
                      );
                    },
                  ),
                ),
              ],
            ],
          ),
          onLoading: const Center(child: CircularProgressIndicator()),
          onError: (error) => Center(child: Text(error.toString())),
        ),
      ),
    );
  }
}
