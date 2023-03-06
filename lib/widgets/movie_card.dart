import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/api/constants.dart';

class MovieCard extends StatelessWidget {
  final String posterPath;
  const MovieCard({super.key, required this.posterPath});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 200,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: CachedNetworkImage(
          imageUrl: '${Constants.imageBaseUrl}$posterPath',
        ),
      ),
    );
  }
}
