import 'dart:async';

class FocusIdRepository {
  FocusIdRepository._();

  static final FocusIdRepository instance = FocusIdRepository._();

  final StreamController<String?> _controller = StreamController.broadcast();
  String? _current;

  Stream<String?> get stream => _controller.stream;
  String? get currentFocusId => _current;

  void setFocus(String id) {
    _current = id;
    _controller.add(id);
  }

  void clear() {
    _current = null;
    _controller.add(null);
  }
}