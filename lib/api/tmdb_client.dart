import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:movie_app/api/constants.dart';

class TmdbClient {
  final Dio client;

  TmdbClient(this.client);

  Future<Response<dynamic>> getResponse(
      {required String path, Map<String, dynamic>? params}) async {
    try {
      client.options.baseUrl = Constants.baseUrl;
      final response = await client.get(path,
          queryParameters: {'api_key': Constants.apiKey, ...params ?? {}});
      return response;
    } on DioError catch (e) {
      if (e.response != null) {
        log(e.response!.data.toString());
      } else {
        log(e.message.toString());
      }
      rethrow;
    }
  }
}
