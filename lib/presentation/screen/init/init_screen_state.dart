import 'package:barrier_free_test/presentation/screen/init/model/init_focus_meta_data.dart';
import 'package:barrier_free_test/presentation/common/models/one_time_event.dart';
import 'package:barrier_free_test/presentation/screen/init/model/init_screen_tts_scenario_event.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'init_screen_state.freezed.dart';

@freezed
abstract class InitScreenState with _$InitScreenState {
  const InitScreenState._();
  const factory InitScreenState({
    InitFocusMetaData? currentFocusMetaData,
    @Default([]) List<String> languageList,
    OneTimeEvent<InitScreenTtsScenarioEvent>? ttsScenarioEvent,
    @Default(false) bool isVoiceMode,
  }) = _InitScreenState;
}
