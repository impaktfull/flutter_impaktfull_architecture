import 'package:dio/dio.dart';
import 'package:impaktfull_architecture/src/model/data/error/localized_error.dart';

abstract class BaseNetworkError<Localization> extends DioException
    with BaseLocalizedModel<Localization> {
  BaseNetworkError({
    required super.requestOptions,
  });

  @override
  String? getTranslatedError(Localization localization) => null;
}
