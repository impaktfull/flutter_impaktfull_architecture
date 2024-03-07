mixin BaseLocalizedModel<Localization> {
  String get errorLocalizationKey;

  String? getTranslatedError(Localization localization);
}

abstract class BaseLocalizedError<Localization> extends Error
    implements BaseLocalizedModel<Localization> {
  @override
  String? getTranslatedError(Localization localization) => null;
}

class SimpleLocalizedMessageError extends Error
    implements BaseLocalizedError<void> {
  final String message;

  SimpleLocalizedMessageError(this.message);
  @override
  String get errorLocalizationKey => message;

  @override
  String? getTranslatedError(void localization) => message;

  @override
  String toString() => 'SimpleLocalizedError: `$message`';
}

class SimpleLocalizedError extends Error implements BaseLocalizedError<void> {
  SimpleLocalizedError();

  @override
  String get errorLocalizationKey => '';

  @override
  String? getTranslatedError(void localization) => null;
}
