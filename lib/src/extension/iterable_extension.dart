extension IterableExtension<T> on Iterable<T> {
  T? firstOrNullWhere(bool Function(T) where) {
    for (final element in this) {
      if (where(element)) return element;
    }
    return null;
  }
}
