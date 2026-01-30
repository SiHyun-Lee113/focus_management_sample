import 'package:flutter/foundation.dart';
import 'package:flutter_tts/flutter_tts.dart';

abstract class TtsService {
  Future<void> setAwaitSpeakCompletion(bool enabled);

  void setStartHandler(VoidCallback handler);
  void setCompletionHandler(VoidCallback handler);
  void setCancelHandler(VoidCallback handler);
  void setPauseHandler(VoidCallback handler);
  void setContinueHandler(VoidCallback handler);
  void setErrorHandler(ErrorHandler handler);

  Future<dynamic> getEngines();
  Future<dynamic> getVoices();
  Future<dynamic> getLanguages();
  Future<dynamic> getDefaultEngine();
  Future<dynamic> getDefaultVoice();

  Future<void> setEngine(String engine);
  Future<void> setVoice(Map<String, String> voice);
  Future<void> setLanguage(String language);
  Future<dynamic> isLanguageInstalled(String language);

  Future<void> setVolume(double volume);
  Future<void> setSpeechRate(double rate);
  Future<void> setPitch(double pitch);
  Future<void> speak(String text);
  Future<int?> stop();
  Future<int?> pause();
  Future<void> synthesizeToFile(String text, String fileName);
  Future<dynamic> getMaxSpeechInputLength();
}
