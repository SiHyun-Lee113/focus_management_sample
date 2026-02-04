import 'package:barrier_free_test/enum/focus/init_screen_focus_code.dart';
import 'package:barrier_free_test/presentation/screen/init/model/init_focus_meta_data.dart';
import 'package:collection/collection.dart';

import 'package:barrier_free_test/domain/focus/base_focus_meta_data_handler.dart';

class InitScreenFocusMetaDataHandler extends BaseFocusMetaDataHandler<InitFocusMetaData> {
  @override
  bool isScreen(InitFocusMetaData metaData) => metaData is ScreenLevel;

  @override
  bool isSection(InitFocusMetaData metaData) => metaData is SectionLevel;

  @override
  bool isWidget(InitFocusMetaData metaData) => metaData is WidgetLevel;

  @override
  bool isLanguage(InitFocusMetaData metaData) => metaData is LanguageLevel;

  @override
  void setCurrentFocusMetaDataById(String id, {bool ttsMute = false}) {
    InitFocusMetaData metaData = findByFocusId(id);

    if (ttsMute) {
      metaData = metaData.copyWith(ttsMute: true);
    }

    updateCurrentMetaData(metaData);
  }

  String getLanguageFocusMetaDataId(String languageName) {
    InitFocusMetaData? language = childrenOf(InitFocusMetaData.initLanguageSectionFocusId)
        .firstWhereOrNull(
      (e) => e is LanguageLevel && e.languageName == languageName,
    );

    if (language == null) throw Exception('languageId is null $languageName');

    return language.focusId;
  }

  String getFocusMetaDataIdByFocusCode(InitScreenFocusCode focusCode) {
    switch (focusCode) {
      case InitScreenFocusCode.screen:
        return InitFocusMetaData.initScreenFocusId;

      case InitScreenFocusCode.section_header:
        return InitFocusMetaData.initHeaderSectionFocusId;

      case InitScreenFocusCode.section_start_order:
        return InitFocusMetaData.initStartOrderSectionFocusId;

      case InitScreenFocusCode.section_language:
        return InitFocusMetaData.initLanguageSectionFocusId;

      case InitScreenFocusCode.widget_home:
        return InitFocusMetaData.initHomeButtonFocusId;

      case InitScreenFocusCode.widget_call_agent:
        return InitFocusMetaData.initCallAgentButtonFocusId;

      case InitScreenFocusCode.widget_start_order:
        return InitFocusMetaData.initStartOrderButtonFocusId;

      case _:
        throw UnimplementedError();
    }
  }
}
