import 'package:dio/dio.dart';
import 'package:impaktfull_architecture/src/model/data/error/localized_error.dart';

abstract class NetworkError extends DioException implements LocalizedError {
  NetworkError({
    required super.requestOptions,
  });
}
