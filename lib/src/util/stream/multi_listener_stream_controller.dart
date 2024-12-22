import 'dart:async';

class MultiListenerStreamController<T extends Object?> {
  T? _value;

  final _controller = StreamController<T>.broadcast();

  MultiListenerStreamController([T? initialValue]) {
    _value = initialValue;
  }

  T get value {
    if (hasValue) {
      return _value as T;
    }
    throw StateError('No value has been emitted yet.');
  }

  T? get valueOrNull => _value;

  bool get hasValue => _value != null;

  void add(T newValue) {
    _value = newValue;
    _controller.add(newValue);
  }

  Stream<T> get stream => _controller.stream.transform(
        StreamTransformer.fromHandlers(
          handleData: (data, sink) {
            if (hasValue) {
              sink.add(_value as T);
            }
          },
        ),
      );

  Stream<T?> get streamOrNull => _controller.stream.transform(
        StreamTransformer.fromHandlers(
          handleData: (data, sink) => sink.add(_value),
        ),
      );

  Future<void> close() => _controller.close();

  bool get isClosed => _controller.isClosed;
}
