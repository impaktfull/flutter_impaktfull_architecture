mixin BaseLocalizedModel<Localization> {
  String get errorLocalizationKey;

  String? getTranslatedError(Localization localization);
}

abstract class BaseLocalizedError<Localization> extends Error
    implements BaseLocalizedModel<Localization> {
  @override
  String? getTranslatedError(Localization localization) => null;
}

class SimpleLocalizedError extends Error implements BaseLocalizedError<void> {
  final String message;

  SimpleLocalizedError(this.message);
  @override
  String get errorLocalizationKey => message;

  @override
  String? getTranslatedError(void localization) => message;
}
