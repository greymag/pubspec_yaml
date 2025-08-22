class Optional<T> {
  final T? _value;
  final bool _hasValue;

  const Optional.value(T value)
      : _value = value,
        _hasValue = true;

  const Optional.notNull(T? value)
      : _value = value,
        _hasValue = value != null;

  const Optional.none()
      : _value = null,
        _hasValue = false;

  static Optional<T> fromMap<T, K, V>(
    Map<K, V> map,
    K key,
  ) {
    if (map.containsKey(key)) {
      final value = map[key];
      if (value is T) {
        return Optional.value(value);
      } else {
        throw ArgumentError('Value for key "$key" is not of expected type $T');
      }
    } else {
      return Optional.none();
    }
  }

  bool get hasValue => _hasValue;

  T valueOr(T Function() orElse) {
    if (_hasValue) {
      return _value as T;
    } else {
      return orElse();
    }
  }

  @override
  String toString() => _hasValue ? 'Optional($_value)' : 'Optional.none()';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! Optional<T>) return false;
    return _hasValue == other._hasValue && _value == other._value;
  }

  @override
  int get hashCode => Object.hash(_hasValue, _value);
}

extension OptionalMapExtension<K, V> on Map<K, V> {
  Optional<T> getOptional<T>(K key) => Optional.fromMap<T, K, V>(this, key);
}
