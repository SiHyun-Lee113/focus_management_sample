import 'package:barrier_free_test/presentation/screen/init/model/init_focus_meta_data.dart';
import 'package:barrier_free_test/enum/focus/init_screen_focus_code.dart';
import 'package:barrier_free_test/presentation/screen/init/init_screen_cubit.dart';
import 'package:flutter/services.dart';

extension InitScreenCubitKeyboardHandlerExtension on InitScreenCubit {
  void handelKeyEvent(LogicalKeyboardKey event) {
    switch (event) {
      case LogicalKeyboardKey.enter:
        if (state.currentFocusMetaData is Widget || state.currentFocusMetaData is Language) {
          if (state.currentFocusMetaData != null) {
            widgetActionHandler(state.currentFocusMetaData!);
          }
        } else {
          focusMetaDataHandler.getChildWidgetFocusMetaData();
        }
        break;
      case LogicalKeyboardKey.escape:
        focusMetaDataHandler.getParentFocusMetaData();
        break;
      case LogicalKeyboardKey.arrowDown:
        focusMetaDataHandler.getDownSectionFocusMetaData();
        break;
      case LogicalKeyboardKey.arrowUp:
        focusMetaDataHandler.getUpSectionFocusMetaData();
      case LogicalKeyboardKey.arrowRight:
        focusMetaDataHandler.getRightWidgetFocusMetaData();
        break;
      case LogicalKeyboardKey.arrowLeft:
        focusMetaDataHandler.getLeftWidgetFocusMetaData();
        break;
      /// TODO 실제 기기 다시듣기 버튼으로 수정
      case LogicalKeyboardKey.backspace:
        ttsService.repeat();
        break;
      case _:
        break;
    }
  }

  void widgetActionHandler(InitFocusMetaData focusMetaData) {
    switch (focusMetaData.focusCode) {
      case InitScreenFocusCode.widget_home:
        print('홈 스크린 이동 로직');
      case InitScreenFocusCode.widget_call_agent:
        print('직원 호출 로직');
      case InitScreenFocusCode.widget_start_order:
        print('메뉴 스트린 이동 로직');
      case InitScreenFocusCode.widget_language:
        final languageFocusMetaData = focusMetaData as Language;
        print('언어 변경 로직 : ${languageFocusMetaData.languageName}');
      case _:
        break;
    }
  }
}
