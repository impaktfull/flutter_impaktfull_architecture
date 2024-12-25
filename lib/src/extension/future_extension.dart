extension FutureExtensions<T> on Future<T> {
  Future<T> takeAtLeast(Duration duration) async {
    final result = await Future.wait([
      this,
      Future.delayed(duration),
    ]);
    return result.first as T;
  }
}
