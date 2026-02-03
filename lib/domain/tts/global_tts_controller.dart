import 'dart:async';

import 'package:barrier_free_test/domain/tts/tts_service.dart';

class TtsRequest {
  final String text;
  final String? source;

  const TtsRequest({
    required this.text,
    this.source,
  });
}

class GlobalTtsController {
  static final GlobalTtsController instance = GlobalTtsController._();

  GlobalTtsController._();

  final StreamController<TtsRequest> _requestController =
      StreamController<TtsRequest>.broadcast();

  StreamSubscription<TtsRequest>? _subscription;
  TtsService? _ttsService;
  int _latestToken = 0;

  void init(TtsService ttsService) {
    if (_ttsService != null) return;
    _ttsService = ttsService;
    _subscription = _requestController.stream.listen(_handleRequest);
  }

  void speak(String text, {String? source}) {
    if (_ttsService == null) return;
    _requestController.add(TtsRequest(text: text, source: source));
  }

  Future<void> stop() async {
    if (_ttsService == null) return;
    _latestToken++;
    await _ttsService!.stop();
  }

  Future<void> _handleRequest(TtsRequest request) async {
    if (_ttsService == null) return;
    final token = ++_latestToken;
    await _ttsService!.speak(request.text);

    if (token != _latestToken) {
      return;
    }
  }

  Future<void> dispose() async {
    await _subscription?.cancel();
    await _requestController.close();
    _subscription = null;
  }
}
