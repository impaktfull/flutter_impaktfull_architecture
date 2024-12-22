import 'dart:async';

/// A simplified BehaviorSubject implementation
class MultiListenerStreamController<T> {
  late T _value;
  bool _hasValue = false;

  final _controller = StreamController<T>.broadcast();

  MultiListenerStreamController([T? initialValue]) {
    if (initialValue != null) {
      _value = initialValue;
      _hasValue = true;
    }
  }

  /// Get the current value
  T get value {
    if (!_hasValue) {
      throw StateError('No value has been emitted yet.');
    }
    return _value;
  }

  /// Emit a new value
  void add(T newValue) {
    _value = newValue;
    _hasValue = true;
    _controller.add(newValue);
  }

  /// Listen to the stream
  Stream<T> get stream {
    return _controller.stream.transform(
      StreamTransformer.fromHandlers(
        handleData: (data, sink) {
          if (_hasValue) {
            sink.add(_value); // Emit the current value to new listeners
          }
        },
      ),
    );
  }

  /// Close the stream
  Future<void> close() => _controller.close();

  /// Check if the stream is closed
  bool get isClosed => _controller.isClosed;
}
