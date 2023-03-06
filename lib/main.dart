import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movie_app/state/bloc_cubit/get_it.dart' as getIt;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:movie_app/state/bloc_cubit/bloc_cubit_screen.dart';
import 'package:movie_app/state/getX/getx_screen.dart';
import 'package:movie_app/state/getX/tmdb_bindings.dart';
import 'package:movie_app/state/riverpod/riverpod_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: RiverpodApp()));
  //runApp(const GetxApp());
  // unawaited(getIt.init());
  // runApp(const BlocCubitApp());
}

class GetxApp extends StatelessWidget {
  const GetxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const GetxScreen(),
      initialBinding: TmdbBindings(),
    );
  }
}

class RiverpodApp extends StatelessWidget {
  const RiverpodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const RiverpodScreen(),
    );
  }
}

class BlocCubitApp extends StatelessWidget {
  const BlocCubitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const BlocCubitScreen(),
    );
  }
}
