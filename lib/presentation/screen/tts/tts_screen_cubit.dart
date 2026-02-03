import 'dart:io' show Platform;

import 'package:barrier_free_test/domain/tts/tts_service.dart';
import 'package:barrier_free_test/presentation/screen/tts/tts_screen_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TtsScreenCubit extends Cubit<TtsScreenState> {
  final TtsService _ttsService;

  TtsScreenCubit(
    super.initialState, {
    required TtsService ttsService,
  }) : _ttsService = ttsService {
    emit(state.copyWith(rate: kIsWeb ? 0.9 : 0.5));
    _init();
  }

  bool get isAndroid => !kIsWeb && Platform.isAndroid;

  bool get isIOS => !kIsWeb && Platform.isIOS;

  bool get isWeb => kIsWeb;

  Future<void> _init() async {
    await _setAwaitOptions();
    _initHandlers();
    await _loadInitialData();
    await _getDefaults();
  }

  void _initHandlers() {
    _ttsService.setStartHandler(() {
      if (kDebugMode) debugPrint("TtsState: Playing");
      emit(state.copyWith(ttsState: TtsPlaybackState.playing));
    });

    _ttsService.setCompletionHandler(() {
      if (kDebugMode) debugPrint("TtsState: Complete");
      emit(state.copyWith(ttsState: TtsPlaybackState.stopped));
    });

    _ttsService.setCancelHandler(() {
      if (kDebugMode) debugPrint("TtsState: Cancel");
      emit(state.copyWith(ttsState: TtsPlaybackState.stopped));
    });

    _ttsService.setPauseHandler(() {
      if (kDebugMode) debugPrint("TtsState: Paused");
      emit(state.copyWith(ttsState: TtsPlaybackState.paused));
    });

    _ttsService.setContinueHandler(() {
      if (kDebugMode) debugPrint("TtsState: Continued");
      emit(state.copyWith(ttsState: TtsPlaybackState.continued));
    });

    _ttsService.setErrorHandler((msg) {
      if (kDebugMode) debugPrint("TtsState: Error: $msg");
      emit(state.copyWith(ttsState: TtsPlaybackState.stopped));
    });
  }

  Future<void> _loadInitialData() async {
    if (isAndroid) await loadEngines();
    await loadVoices();
    await loadLanguages();
  }

  Future<void> _getDefaults() async {
    if (kDebugMode) debugPrint('_getDefaults...');
    if (isAndroid) await _getDefaultEngine();
    await _getDefaultVoice();
  }

  Future<void> loadEngines() async {
    emit(state.copyWith(enginesLoading: true, enginesError: null));
    try {
      final result = await _ttsService.getEngines();
      final engines = (result as List<dynamic>).map((e) => e as String?).toList();
      emit(state.copyWith(engines: engines, enginesLoading: false));
    } catch (e) {
      emit(state.copyWith(enginesLoading: false, enginesError: e.toString()));
    }
  }

  Future<void> loadVoices() async {
    emit(state.copyWith(voicesLoading: true, voicesError: null));
    try {
      final result = await _ttsService.getVoices();
      final voices = (result as List<dynamic>)
          .map((item) => Map<String, String>.from(item as Map))
          .toList();
      emit(state.copyWith(voices: voices, voicesLoading: false));
    } catch (e) {
      emit(state.copyWith(voicesLoading: false, voicesError: e.toString()));
    }
  }

  Future<void> loadLanguages() async {
    emit(state.copyWith(languagesLoading: true, languagesError: null));
    try {
      final result = await _ttsService.getLanguages();
      final languages = (result as List<dynamic>).map((e) => e as String?).toList();
      emit(state.copyWith(languages: languages, languagesLoading: false));
    } catch (e) {
      emit(state.copyWith(languagesLoading: false, languagesError: e.toString()));
    }
  }

  Future<void> _getDefaultEngine() async {
    if (!isAndroid) return;
    if (kDebugMode) debugPrint('_getDefaultEngine...');
    final engine = await _ttsService.getDefaultEngine();
    if (engine != null) {
      if (kDebugMode) debugPrint('Default Engine: $engine');
      emit(state.copyWith(engine: engine as String));
    }
  }

  Future<void> _getDefaultVoice() async {
    if (kDebugMode) debugPrint('_getDefaultVoice..');
    if (state.voices.isEmpty) return;

    if (isAndroid) {
      final defVoice = await _ttsService.getDefaultVoice();
      if (kDebugMode) debugPrint('Android Default Voice: $defVoice');
      if (defVoice != null) {
        final targetVoice = Map<String, String>.from(defVoice as Map);
        final rawVoice = _findMatchingVoice(targetVoice);
        if (rawVoice != null) {
          await _applyVoice(rawVoice);
        }
      }
    } else {
      Locale deviceLocale = WidgetsBinding.instance.platformDispatcher.locale;
      if (kDebugMode) debugPrint('Device Locale (ISO): $deviceLocale');
      String myLocale = deviceLocale.toLanguageTag();
      if (kIsWeb && !myLocale.contains('-')) {
        const webLocale = 'en-US';
        if (kDebugMode) debugPrint('webLocale: $webLocale');
        myLocale = webLocale;
      }
      if (kDebugMode) debugPrint('Device/Browser Locale (BCP47): $myLocale');

      final rawVoice = _findBestLocaleVoice(myLocale);
      if (rawVoice != null) {
        if (kDebugMode) debugPrint('Computed Default Voice: $rawVoice');
        await _applyVoice(rawVoice);
      }
    }
  }

  Map<String, String>? _findMatchingVoice(Map<String, String> targetVoice) {
    try {
      return state.voices.firstWhere((v) => mapEquals(v, targetVoice));
    } catch (_) {
      return null;
    }
  }

  Map<String, String>? _findBestLocaleVoice(String locale) {
    try {
      return state.voices.firstWhere((v) => v['locale'] == locale);
    } catch (_) {
      try {
        return state.voices.firstWhere((v) => v['locale']?.startsWith(locale) ?? false);
      } catch (_) {
        return null;
      }
    }
  }

  Future<void> _applyVoice(Map<String, String> selectedVoice) async {
    await _ttsService.setVoice(selectedVoice);
    emit(state.copyWith(voice: selectedVoice, language: selectedVoice['locale']));
  }

  Future<void> changeEngine(String? selectedEngine) async {
    if (selectedEngine == null || selectedEngine.trim().isEmpty) {
      return;
    }
    await _ttsService.setEngine(selectedEngine);
    emit(
      state.copyWith(
        engine: selectedEngine,
        voice: null,
        language: null,
        isCurrentLanguageInstalled: false,
        voices: const [],
        languages: const [],
      ),
    );
    await loadVoices();
    await loadLanguages();
    await _getDefaultVoice();
  }

  Future<void> changeVoice(Map<String, String>? selectedVoice) async {
    if (selectedVoice == null || selectedVoice.isEmpty) {
      return;
    }
    if (kDebugMode) debugPrint('changeVoice...');
    await _applyVoice(selectedVoice);
  }

  Future<void> changeLanguage(String? selectedLanguage) async {
    if (selectedLanguage == null || selectedLanguage.trim().isEmpty) {
      return;
    }
    if (kDebugMode) debugPrint('changeLanguage...');
    await _ttsService.setLanguage(selectedLanguage);
    bool isInstalled = false;
    if (isAndroid) {
      final result = await _ttsService.isLanguageInstalled(selectedLanguage);
      isInstalled = (result as bool?) ?? false;
    }
    emit(state.copyWith(language: selectedLanguage, isCurrentLanguageInstalled: isInstalled));

    final matchingVoice = _findBestLocaleVoice(selectedLanguage);
    if (matchingVoice != null) {
      await _applyVoice(matchingVoice);
    }
  }

  void onTextChanged(String text) {
    emit(state.copyWith(newVoiceText: text));
  }

  void changeVolume(double value) {
    emit(state.copyWith(volume: value));
  }

  void changePitch(double value) {
    emit(state.copyWith(pitch: value));
  }

  void changeRate(double value) {
    emit(state.copyWith(rate: value));
  }

  Future<void> speak() async {
    await _ttsService.setVolume(state.volume);
    await _ttsService.setSpeechRate(state.rate);
    await _ttsService.setPitch(state.pitch);

    final text = state.newVoiceText;
    if (text != null && text.isNotEmpty) {
      await _ttsService.speak(text);
    }
  }

  Future<void> stop() async {
    final result = await _ttsService.stop();
    if (result == 1) {
      emit(state.copyWith(ttsState: TtsPlaybackState.stopped));
    }
  }

  Future<void> pause() async {
    final result = await _ttsService.pause();
    if (result == 1) {
      emit(state.copyWith(ttsState: TtsPlaybackState.paused));
    }
  }

  Future<void> saveToFile() async {
    final text = state.newVoiceText;
    if (text == null || text.trim().isEmpty) return;

    String fileBase = text.trim();
    fileBase = fileBase.replaceAll(RegExp(r'\s+'), '_');
    fileBase = fileBase.replaceAll(
      RegExp(r'[^\p{L}\p{M}\p{N}_]', unicode: true),
      '',
    );
    fileBase = fileBase.substring(0, fileBase.length > 40 ? 40 : fileBase.length);
    if (fileBase.isEmpty) return;

    final fileName = isAndroid ? '$fileBase.mp3' : '$fileBase.caf';
    await _ttsService.synthesizeToFile(text, fileName);
    if (kDebugMode) debugPrint('synthesized to: $fileName');
  }

  Future<void> loadMaxSpeechInputLength() async {
    final inputLength = await _ttsService.getMaxSpeechInputLength();
    emit(state.copyWith(inputLength: inputLength as int?));
  }

  Future<void> _setAwaitOptions() async {
    await _ttsService.setAwaitSpeakCompletion(true);
  }

  @override
  Future<void> close() {
    _ttsService.stop();
    return super.close();
  }
}
