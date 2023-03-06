import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

enum AppErrorType { network, api, unknown }

class AppError extends Equatable {
  final AppErrorType? type;
  final String? message;

  const AppError({this.type, this.message});

  @override
  List<Object?> get props => [type];

  AppError handleError(DioError e) {
    if (e.type == DioErrorType.unknown && e.message is SocketException) {
      log(e.message.toString());
      return AppError(
          type: AppErrorType.network, message: e.message.toString());
    } else if (e.response!.statusCode == 401 || e.response!.statusCode == 404) {
      log(e.response!.data.toString());
      return AppError(
          type: AppErrorType.api, message: e.response!.data.toString());
    } else {
      log(e.response!.data.toString());
      return AppError(
          type: AppErrorType.unknown, message: e.response!.data.toString());
    }
  }

  void showSnackbar(SnackBar snackBar, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
