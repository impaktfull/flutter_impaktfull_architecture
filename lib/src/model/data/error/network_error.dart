import 'package:dio/dio.dart';
import 'package:impaktfull_architecture/src/model/data/error/localized_error.dart';

abstract class BaseNetworkError<Localization> extends DioException implements BaseLocalizedError<Localization> {
  BaseNetworkError({
    required super.requestOptions,
  });
}
