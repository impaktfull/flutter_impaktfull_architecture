mixin BaseLocalizedModel<Localization> {
  String get errorLocalizationKey;

  String? getTranslatedError(Localization localization);
}

abstract class BaseLocalizedError<Localization> extends Error
    implements BaseLocalizedModel<Localization> {
  @override
  String? getTranslatedError(Localization localization) => null;
}
