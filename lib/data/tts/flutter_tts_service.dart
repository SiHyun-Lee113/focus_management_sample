import 'package:flutter/foundation.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:barrier_free_test/domain/tts/tts_service.dart';

class FlutterTtsService implements TtsService {
  final FlutterTts _tts;

  FlutterTtsService({FlutterTts? tts}) : _tts = tts ?? FlutterTts();

  @override
  Future<void> setAwaitSpeakCompletion(bool enabled) async {
    await _tts.awaitSpeakCompletion(enabled);
  }

  @override
  void setStartHandler(VoidCallback handler) {
    _tts.setStartHandler(handler);
  }

  @override
  void setCompletionHandler(VoidCallback handler) {
    _tts.setCompletionHandler(handler);
  }

  @override
  void setCancelHandler(VoidCallback handler) {
    _tts.setCancelHandler(handler);
  }

  @override
  void setPauseHandler(VoidCallback handler) {
    _tts.setPauseHandler(handler);
  }

  @override
  void setContinueHandler(VoidCallback handler) {
    _tts.setContinueHandler(handler);
  }

  @override
  void setErrorHandler(ErrorHandler handler) {
    _tts.setErrorHandler(handler);
  }

  @override
  Future<dynamic> getEngines() async => _tts.getEngines;

  @override
  Future<dynamic> getVoices() async => _tts.getVoices;

  @override
  Future<dynamic> getLanguages() async => _tts.getLanguages;

  @override
  Future<dynamic> getDefaultEngine() async => _tts.getDefaultEngine;

  @override
  Future<dynamic> getDefaultVoice() async => _tts.getDefaultVoice;

  @override
  Future<void> setEngine(String engine) async {
    await _tts.setEngine(engine);
  }

  @override
  Future<void> setVoice(Map<String, String> voice) async {
    await _tts.setVoice(voice);
  }

  @override
  Future<void> setLanguage(String language) async {
    await _tts.setLanguage(language);
  }

  @override
  Future<dynamic> isLanguageInstalled(String language) async {
    return _tts.isLanguageInstalled(language);
  }

  @override
  Future<void> setVolume(double volume) async {
    await _tts.setVolume(volume);
  }

  @override
  Future<void> setSpeechRate(double rate) async {
    await _tts.setSpeechRate(rate);
  }

  @override
  Future<void> setPitch(double pitch) async {
    await _tts.setPitch(pitch);
  }

  @override
  Future<void> speak(String text) async {
    await _tts.speak(text);
  }

  @override
  Future<int?> stop() async => await _tts.stop();

  @override
  Future<int?> pause() async => await _tts.pause();

  @override
  Future<void> synthesizeToFile(String text, String fileName) async {
    await _tts.synthesizeToFile(text, fileName);
  }

  @override
  Future<dynamic> getMaxSpeechInputLength() async {
    return _tts.getMaxSpeechInputLength;
  }
}
