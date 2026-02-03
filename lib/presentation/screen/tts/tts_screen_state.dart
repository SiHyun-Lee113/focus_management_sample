import 'package:flutter/foundation.dart';

enum TtsPlaybackState { playing, stopped, paused, continued }

@immutable
class TtsScreenState {
  final List<String?> engines;
  final List<Map<String, String>> voices;
  final List<String?> languages;
  final String? engine;
  final Map<String, String>? voice;
  final String? language;
  final double volume;
  final double pitch;
  final double rate;
  final bool isCurrentLanguageInstalled;
  final String? newVoiceText;
  final int? inputLength;
  final TtsPlaybackState ttsState;
  final bool enginesLoading;
  final bool voicesLoading;
  final bool languagesLoading;
  final String? enginesError;
  final String? voicesError;
  final String? languagesError;

  const TtsScreenState({
    this.engines = const [],
    this.voices = const [],
    this.languages = const [],
    this.engine,
    this.voice,
    this.language,
    this.volume = 0.8,
    this.pitch = 1.0,
    this.rate = 0.5,
    this.isCurrentLanguageInstalled = false,
    this.newVoiceText,
    this.inputLength,
    this.ttsState = TtsPlaybackState.stopped,
    this.enginesLoading = false,
    this.voicesLoading = false,
    this.languagesLoading = false,
    this.enginesError,
    this.voicesError,
    this.languagesError,
  });

  TtsScreenState copyWith({
    List<String?>? engines,
    List<Map<String, String>>? voices,
    List<String?>? languages,
    String? engine,
    Map<String, String>? voice,
    String? language,
    double? volume,
    double? pitch,
    double? rate,
    bool? isCurrentLanguageInstalled,
    String? newVoiceText,
    int? inputLength,
    TtsPlaybackState? ttsState,
    bool? enginesLoading,
    bool? voicesLoading,
    bool? languagesLoading,
    String? enginesError,
    String? voicesError,
    String? languagesError,
  }) {
    return TtsScreenState(
      engines: engines ?? this.engines,
      voices: voices ?? this.voices,
      languages: languages ?? this.languages,
      engine: engine ?? this.engine,
      voice: voice ?? this.voice,
      language: language ?? this.language,
      volume: volume ?? this.volume,
      pitch: pitch ?? this.pitch,
      rate: rate ?? this.rate,
      isCurrentLanguageInstalled: isCurrentLanguageInstalled ?? this.isCurrentLanguageInstalled,
      newVoiceText: newVoiceText ?? this.newVoiceText,
      inputLength: inputLength ?? this.inputLength,
      ttsState: ttsState ?? this.ttsState,
      enginesLoading: enginesLoading ?? this.enginesLoading,
      voicesLoading: voicesLoading ?? this.voicesLoading,
      languagesLoading: languagesLoading ?? this.languagesLoading,
      enginesError: enginesError ?? this.enginesError,
      voicesError: voicesError ?? this.voicesError,
      languagesError: languagesError ?? this.languagesError,
    );
  }
}
