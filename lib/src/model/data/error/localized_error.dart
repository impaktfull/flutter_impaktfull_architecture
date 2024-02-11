abstract class LocalizedError extends Error {
  String get errorLocalizationKey;

  LocalizedError();
}

class SimpleLoclizedError extends LocalizedError {
  final String errorKey;

  SimpleLoclizedError(this.errorKey);

  @override
  String get errorLocalizationKey => errorKey;
}
