abstract class BaseLocalizedError<Localization> extends Error {
  String get errorLocalizationKey;

  BaseLocalizedError();

  String? getTranslatedError(Localization localization) => null;
}

class SimpleLoclizedError extends BaseLocalizedError<void> {
  final String errorKey;

  SimpleLoclizedError(this.errorKey);

  @override
  String get errorLocalizationKey => errorKey;
}
