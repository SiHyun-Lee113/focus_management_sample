import 'package:barrier_free_test/enum/focus/init_screen_focus_code.dart';
import 'package:barrier_free_test/presentation/screen/init/model/init_focus_meta_data.dart';
import 'package:barrier_free_test/presentation/screen/init/model/init_screen_tts_scenario_event.dart';

extension InitFocusMetaDataMapper on InitFocusMetaData {
  static InitScreenTtsScenarioEvent toTtsScenarioEvent(InitFocusMetaData initFocusMetaData) {
    switch (initFocusMetaData.focusCode) {
      case InitScreenFocusCode.screen:
        return const InitScreenApproach();

      case InitScreenFocusCode.section_header:
        return const InitScreenSectionHeader();

      case InitScreenFocusCode.section_start_order:
        return const InitScreenSectionStartOrder();

      case InitScreenFocusCode.section_language:
        return const InitScreenSectionLanguage();

      case InitScreenFocusCode.widget_home:
        return const InitScreenWidgetHome();

      case InitScreenFocusCode.widget_call_agent:
        return const InitScreenWidgetCallAgent();

      case InitScreenFocusCode.widget_start_order:
        return const InitScreenWidgetStartOrder();

      case InitScreenFocusCode.widget_language:
        Language language = initFocusMetaData as Language;
        return InitScreenWidgetLanguage(language.languageName);
    }
  }
}