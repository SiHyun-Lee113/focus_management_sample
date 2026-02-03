import 'package:barrier_free_test/presentation/screen/init/model/init_focus_meta_data.dart';
import 'package:barrier_free_test/enum/focus/init_screen_focus_code.dart';
import 'package:barrier_free_test/presentation/screen/init/init_screen_cubit.dart';
import 'package:flutter/services.dart';

extension InitScreenCubitKeyboardHandlerExtension on InitScreenCubit {
  void handelKeyEvent(LogicalKeyboardKey event) {
    switch (event) {
      case LogicalKeyboardKey.enter:
        if (state.currentFocusMetaData is WidgetLevel || state.currentFocusMetaData is LanguageLevel) {
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
        navigateHome();
      case InitScreenFocusCode.widget_call_agent:
        callAgent();
      case InitScreenFocusCode.widget_start_order:
        navigateStartOrder();
      case InitScreenFocusCode.widget_language:
        final languageFocusMetaData = focusMetaData as LanguageLevel;
        changeLanguage(languageFocusMetaData.languageName);
      case _:
        break;
    }
  }
}
