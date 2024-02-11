mixin BaseLocalizedError<Localization> {
  String get errorLocalizationKey;

  String? getTranslatedError(Localization localization);
}

abstract class LocalizedError<Localization> extends Error
    implements BaseLocalizedError<Localization> {
  @override
  String? getTranslatedError(void localization) => null;
}
