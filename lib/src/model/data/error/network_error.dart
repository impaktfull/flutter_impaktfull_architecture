import 'package:dio/dio.dart';
import 'package:impaktfull_architecture/src/model/data/error/localized_error.dart';

abstract class BaseNetworkError<Localization> extends DioException
    with BaseLocalizedError<Localization> {
  BaseNetworkError({
    required super.requestOptions,
  });

  @override
  String? getTranslatedError(Localization localization) => null;
}
