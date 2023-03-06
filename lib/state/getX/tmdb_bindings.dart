import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:movie_app/api/tmdb_client.dart';
import 'package:movie_app/repository/repository.dart';
import 'package:movie_app/state/getX/tmdb_getx_controller.dart';

class TmdbBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Dio>(() => Dio());
    Get.lazyPut<TmdbClient>(() => TmdbClient(Dio()));
    Get.lazyPut<Repository>(() => RepositoryImpl(Get.find()));
    Get.lazyPut<TmdbGetxController>(() => TmdbGetxController(Get.find()));
  }
}
