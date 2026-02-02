class OneTimeEvent<T> {
  bool _consumed = false;
  final T data;

  OneTimeEvent({required this.data});

  T? consume() {
    if (_consumed) return null;
    _consumed = true;
    return data;
  }

  /// return OneTimeEvent instance which has same data but can consumed
  OneTimeEvent<T> rewind() {
    return (_consumed) ? OneTimeEvent(data: data) : this;
  }
}