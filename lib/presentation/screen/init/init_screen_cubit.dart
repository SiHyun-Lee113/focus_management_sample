import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:barrier_free_test/domain/focus/models/focus_meta_data.dart';
import 'package:barrier_free_test/domain/tts/tts_service.dart';
import 'package:barrier_free_test/presentation/common/models/one_time_event.dart';
import 'package:barrier_free_test/presentation/screen/init/model/init_focus_meta_data.dart';
import 'package:barrier_free_test/domain/focus/init/init_screen_focus_meta_data_handler.dart';
import 'package:barrier_free_test/enum/focus/init_screen_focus_code.dart';
import 'package:barrier_free_test/presentation/screen/init/init_screen_state.dart';
import 'package:barrier_free_test/presentation/screen/init/model/init_screen_tts_scenario_event.dart';
import 'package:barrier_free_test/presentation/screen/init/model/utils/mapper.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:win32audio/win32audio.dart';

class InitScreenCubit extends Cubit<InitScreenState> {
  final InitScreenFocusMetaDataHandler focusMetaDataHandler;
  final TtsService ttsService;

  StreamSubscription<InitFocusMetaData>? _focusMetaDataStreamSubscription;
  int deviceSpeakerCount = 0;

  InitScreenCubit(
    super.initialState, {
    required this.focusMetaDataHandler,
    required this.ttsService,
  }) {
    _initResource();
    initScreenMetaDataResource();
    _initSubscription();
    _initDeviceSpeakerCount();
  
    emit(state.copyWith(
            isVoiceMode: true,
          ));
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
    if (state.isVoiceMode) {
      String id = focusMetaDataHandler.getFocusMetaDataIdByFocusCode(InitScreenFocusCode.widget_home);
      focusMetaDataHandler.setCurrentFocusMetaDataById(id, applyStream: false);
      _clickSoundEvent();
    }
  }

  void callAgent() {
    print('InitScreenCubit.callAgent');
    if (state.isVoiceMode) {
      String id = focusMetaDataHandler.getFocusMetaDataIdByFocusCode(InitScreenFocusCode.widget_call_agent);
      focusMetaDataHandler.setCurrentFocusMetaDataById(id, applyStream: false);
      _clickSoundEvent();
    }
  }

  void navigateStartOrder() {
    print('InitScreenCubit.navigateStartOrder');
    if (state.isVoiceMode) {
      String id = focusMetaDataHandler.getFocusMetaDataIdByFocusCode(InitScreenFocusCode.widget_start_order);
      focusMetaDataHandler.setCurrentFocusMetaDataById(id, applyStream: false);
      _clickSoundEvent();
    }
  }

  void changeLanguage(String language) {
    print('InitScreenCubit.changeLanguage $language');
    if (state.isVoiceMode) {
      String id = focusMetaDataHandler.getLanguageFocusMetaDataId(language);
      focusMetaDataHandler.setCurrentFocusMetaDataById(id, applyStream: false);
      _clickSoundEvent();
    }
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

  void _initSubscription() {
    _focusMetaDataStreamSubscription = focusMetaDataHandler.getFocusMetaDataStream().listen((
      focusMetaData,
    ) {
      print('InitScreenCubit._initSubscription ${focusMetaData.focusId}');

      emit(
        state.copyWith(
          currentFocusMetaData: focusMetaData,
          ttsScenarioEvent: OneTimeEvent(
            data: InitFocusMetaDataMapper.toTtsScenarioEvent(focusMetaData),
          ),
        ),
      );
    });

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

  void initScreenMetaDataResource() {
    List<InitFocusMetaData> focusMetaDataList = InitFocusMetaData.defaultFocusMetaDataList();

    for (var focusMetaData in focusMetaDataList) {
      focusMetaDataHandler.addFocusMetaData(focusMetaData);
    }

    for (var language in state.languageList) {
      focusMetaDataHandler.addFocusMetaData(
        InitFocusMetaData.language(
          focusCode: InitScreenFocusCode.widget_language,
          focusId: 'languageId$language',
          parentFocusId: InitFocusMetaData.initLanguageSectionFocusId,
          languageName: language,
        ),
      );
    }

    focusMetaDataHandler.setCurrentFocusMetaDataById(InitFocusMetaData.initScreenFocusId);
  }
}
