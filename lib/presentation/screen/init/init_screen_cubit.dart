import 'dart:async';
import 'dart:io';
import 'package:barrier_free_test/domain/tts/tts_service.dart';
import 'package:barrier_free_test/presentation/common/models/one_time_event.dart';
import 'package:barrier_free_test/presentation/screen/init/init_screen_state.dart';
import 'package:barrier_free_test/presentation/screen/init/model/init_screen_tts_scenario_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:win32audio/win32audio.dart';

class InitScreenCubit extends Cubit<InitScreenState> {
  final TtsService ttsService;

  int deviceSpeakerCount = 0;

  InitScreenCubit(
    super.initialState, {
    required this.ttsService,
  }) {
    _initResource();
    _initAudioListener();
    _initDeviceSpeakerCount();
  }

  void _clickSoundEvent() {
    emit(state.copyWith(
      ttsScenarioEvent: OneTimeEvent(
        data: InitScreenButtonClick(),
      ),
    ));
  }

  void navigateHome() {
    print('InitScreenCubit.navigateHome');
    _clickSoundEvent();
  }

  void callAgent() {
    print('InitScreenCubit.callAgent');
    _clickSoundEvent();
  }

  void navigateStartOrder() {
    print('InitScreenCubit.navigateStartOrder');
    _clickSoundEvent();
  }

  void changeLanguage(String language) {
    print('InitScreenCubit.changeLanguage $language');
    _clickSoundEvent();
  }

  void _initResource() async {
    emit(state.copyWith(languageList: ['한국어', '영어', '중국어', '일어']));
  }

  Future<void> _initDeviceSpeakerCount() async {
    final outputDevices = await Audio.enumDevices(AudioDeviceType.output);

    deviceSpeakerCount = outputDevices?.length ?? -1;

    print('InitScreenCubit._initDeviceSpeakerCount $deviceSpeakerCount');
  }

  Timer? _audioChangeDebounce;

  void _initAudioListener() {
    Audio.addChangeListener((String type, String id) {
      _audioChangeDebounce?.cancel();
      _audioChangeDebounce = Timer(const Duration(milliseconds: 500), () async {
        final outputDevices = await Audio.enumDevices(AudioDeviceType.output);
        print('Audio.enumDevices output: $outputDevices');

        final inputDevices = await Audio.enumDevices(AudioDeviceType.input);
        print('Audio.enumDevices input: $inputDevices');

        final isSpeakerAdd = await isAttachSpeaker();
        print('Audio.isSpeakerAdd: $isSpeakerAdd');

        if (isSpeakerAdd) {
          emit(state.copyWith(
            isVoiceMode: true,
          ));
        }

        await _initDeviceSpeakerCount();
      });
    });
  }

  Future<bool> isAttachSpeaker() async {
    if (Platform.isAndroid) return false;
    try {
      var audioDevices = await Audio.enumDevices(AudioDeviceType.output) ?? [];
      // 장치가 1개 이하인 경우(스피커만 있는 경우) -> 외부 스피커 연결로 간주
      return audioDevices.length > deviceSpeakerCount;
    } catch (exception, stack) {
      print(exception);
      print(stack);
      return false;
    }
  }

  void announce(InitScreenTtsScenarioEvent event) {
    emit(
      state.copyWith(
        ttsScenarioEvent: OneTimeEvent(data: event),
      ),
    );
  }
}
