import 'dart:async';

import 'package:barrier_free_test/domain/focus/models/focus_meta_data.dart';
import 'package:barrier_free_test/presentation/common/models/one_time_event.dart';
import 'package:barrier_free_test/presentation/screen/init/model/init_focus_meta_data.dart';
import 'package:barrier_free_test/domain/focus/init/init_screen_focus_meta_data_handler.dart';
import 'package:barrier_free_test/enum/focus/init_screen_focus_code.dart';
import 'package:barrier_free_test/presentation/screen/init/init_screen_state.dart';
import 'package:barrier_free_test/presentation/screen/init/model/mapper/mapper.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InitScreenCubit extends Cubit<InitScreenState> {
  final InitScreenFocusMetaDataHandler focusMetaDataHandler;

  StreamSubscription<InitFocusMetaData>? _focusMetaDataStreamSubscription;

  InitScreenCubit(super.initialState, {required this.focusMetaDataHandler}) {
    _initResource();
    initScreenMetaDataResource();
    _initSubscription();
  }

  void test() {}

  void _initResource() async {
    emit(state.copyWith(languageList: ['한국어', '영어', '중국어', '일어']));
  }

  void initScreenMetaDataResource() {
    final String initScreenFocusId = 'initFocusId';

    final String initHeaderFocusId = 'initHeaderId';
    final String initStartOrderFocusId = 'initStartOrderFocusId';
    final String initLanguageFocusId = 'initLanguageFocusId';

    focusMetaDataHandler.addFocusMetaData(
      InitFocusMetaData.screen(focusId: initScreenFocusId, screenName: '초기 설정 화면'),
    );

    focusMetaDataHandler.addFocusMetaData(
      InitFocusMetaData.section(
        focusCode: InitScreenFocusCode.section_header,
        focusId: initHeaderFocusId,
        parentFocusId: initScreenFocusId,
        sectionName: '상단 영역',
      ),
    );

    focusMetaDataHandler.addFocusMetaData(
      InitFocusMetaData.widget(
        focusCode: InitScreenFocusCode.widget_home,
        focusId: 'widgetHome',
        parentFocusId: initHeaderFocusId,
        widgetName: '처음으로',
      ),
    );

    focusMetaDataHandler.addFocusMetaData(
      InitFocusMetaData.widget(
        focusCode: InitScreenFocusCode.widget_call_agent,
        focusId: 'widgetCallAgent',
        parentFocusId: initHeaderFocusId,
        widgetName: '직원호출',
      ),
    );

    focusMetaDataHandler.addFocusMetaData(
      InitFocusMetaData.section(
        focusCode: InitScreenFocusCode.section_start_order,
        focusId: initStartOrderFocusId,
        parentFocusId: initScreenFocusId,
        sectionName: '주문 영역',
      ),
    );

    focusMetaDataHandler.addFocusMetaData(
      InitFocusMetaData.widget(
        focusCode: InitScreenFocusCode.widget_start_order,
        focusId: 'widgetStartOrder',
        parentFocusId: initStartOrderFocusId,
        widgetName: '주문 하기',
      ),
    );

    focusMetaDataHandler.addFocusMetaData(
      InitFocusMetaData.section(
        focusCode: InitScreenFocusCode.section_language,
        focusId: initLanguageFocusId,
        parentFocusId: initScreenFocusId,
        sectionName: '언어 영역',
      ),
    );

    for (var language in state.languageList) {
      focusMetaDataHandler.addFocusMetaData(
        InitFocusMetaData.language(
          focusCode: InitScreenFocusCode.widget_language,
          focusId: 'languageId$language',
          parentFocusId: initLanguageFocusId,
          languageName: language,
        ),
      );
    }

    focusMetaDataHandler.setCurrentScreenFocusMetaDataById(initScreenFocusId);
  }

  void _initSubscription() {
    _focusMetaDataStreamSubscription = focusMetaDataHandler.getFocusMetaDataStream().listen((
      focusMetaData,
    ) {
      emit(
        state.copyWith(
          currentFocusMetaData: focusMetaData,
          ttsScenarioEvent: OneTimeEvent(
            data: InitFocusMetaDataMapper.toTtsScenarioEvent(focusMetaData),
          ),
        ),
      );
    });
  }
}
