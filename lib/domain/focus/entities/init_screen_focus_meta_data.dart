import 'package:barrier_free_test/domain/focus/entities/focus_meta_data.dart';

/// init 기준 메타데이터

const initScreenFocusId = 'initScreen';

/// 스크린
class InitScreenFocusMetaData extends ScreenFocusMetaData {
  InitScreenFocusMetaData({
    super.focusId = initScreenFocusId,
    super.screenName = '초기화면',
    super.sortOrder = 0,
  });
}

/// 영역
const initHeaderSectionFocusId = 'init_header_section';

class InitHeaderSectionMetaData extends SectionFocusMetaData {
  InitHeaderSectionMetaData({
    super.parentFocusId = initScreenFocusId,
    super.focusId = initHeaderSectionFocusId,
    super.sectionName = '상단 영역',
    super.sortOrder = 0,
  });
}

const initStartOrderSectionFocusId = 'init_start_order_section';

class InitStartOrderSectionMetaData extends SectionFocusMetaData {
  InitStartOrderSectionMetaData({
    super.parentFocusId = initScreenFocusId,
    super.focusId = initStartOrderSectionFocusId,
    super.sectionName = '주문 영역',
    super.sortOrder = 1,
  });
}

const initLanguageSectionFocusId = 'init_language_section';

class InitLanguageSectionMetaData extends SectionFocusMetaData {
  InitLanguageSectionMetaData({
    super.parentFocusId = initScreenFocusId,
    super.focusId = initLanguageSectionFocusId,
    super.sectionName = '언어 선택 영역',
    super.sortOrder = 2,
  });
}

const initVoicesSettingDialogFocusId = 'init_voices_setting_dialog_section';

class InitVoicesSettingDialogSectionMetaData extends SectionFocusMetaData {
  InitVoicesSettingDialogSectionMetaData({
    super.parentFocusId = initScreenFocusId,
    super.focusId = initVoicesSettingDialogFocusId,
    super.sectionName = '음성 안내 설정 영역',
    super.sortOrder = 3,
  });
}

const initVoicesDecibelSettingSectionFocusId =
    'init_voices_decibel_setting_section';

class InitVoicesDecibelSettingSectionMetaData extends SectionFocusMetaData {
  InitVoicesDecibelSettingSectionMetaData({
    super.parentFocusId = initVoicesSettingDialogFocusId,
    super.focusId = initVoicesDecibelSettingSectionFocusId,
    super.sectionName = '음량 설정 영역',
    super.sortOrder = 0,
  });
}

const initVoicesSpeedSettingSectionFocusId =
    'init_voices_speed_setting_section';

class InitVoicesSpeedSettingSectionMetaData extends SectionFocusMetaData {
  InitVoicesSpeedSettingSectionMetaData({
    super.parentFocusId = initVoicesSettingDialogFocusId,
    super.focusId = initVoicesSpeedSettingSectionFocusId,
    super.sectionName = '음속 설정 영역',
    super.sortOrder = 1,
  });
}

const initVoicesSettingConfirmSectionFocusId =
    'init_voices_setting_confirm_section';

class InitVoicesSettingConfirmSectionMetaData extends SectionFocusMetaData {
  InitVoicesSettingConfirmSectionMetaData({
    super.parentFocusId = initVoicesSettingDialogFocusId,
    super.focusId = initVoicesSpeedSettingSectionFocusId,
    super.sectionName = '음속 설정 결정 영역',
    super.sortOrder = 2,
  });
}

/// 위젯
class InitCallManagerWidgetMetaData extends WidgetFocusMetaData {
  InitCallManagerWidgetMetaData({
    required super.focusId,
    super.widgetName = '직원호출',
    super.parentFocusId = initHeaderSectionFocusId,
    super.sortOrder = 0,
  });
}

class InitStartOrderWidgetMetaData extends WidgetFocusMetaData {
  InitStartOrderWidgetMetaData({
    required super.focusId,
    super.widgetName = '주문하기',
    super.parentFocusId = initHeaderSectionFocusId,
    super.sortOrder = 0,
  });
}

class InitLanguageWidgetMetaData extends WidgetFocusMetaData {
  InitLanguageWidgetMetaData({
    required super.focusId,
    required super.widgetName,
    super.parentFocusId = initHeaderSectionFocusId,
    required super.sortOrder,
  });
}

class InitDecibelDecreaseWidgetMetaData extends WidgetFocusMetaData {
  InitDecibelDecreaseWidgetMetaData({
    required super.focusId,
    super.widgetName = '작게',
    super.parentFocusId = initHeaderSectionFocusId,
    super.sortOrder = 0,
  });
}

class InitDecibelIncreaseWidgetMetaData extends WidgetFocusMetaData {
  InitDecibelIncreaseWidgetMetaData({
    required super.focusId,
    super.widgetName = '크게',
    super.parentFocusId = initHeaderSectionFocusId,
    super.sortOrder = 1,
  });
}

class InitSpeedDecreaseWidgetMetaData extends WidgetFocusMetaData {
  InitSpeedDecreaseWidgetMetaData({
    required super.focusId,
    super.widgetName = '느리게',
    super.parentFocusId = initHeaderSectionFocusId,
    super.sortOrder = 0,
  });
}

class InitSpeedIncreaseWidgetMetaData extends WidgetFocusMetaData {
  InitSpeedIncreaseWidgetMetaData({
    required super.focusId,
    super.widgetName = '빠르게',
    super.parentFocusId = initHeaderSectionFocusId,
    super.sortOrder = 1,
  });
}

class InitVoicesSettingCloseWidgetMetaData extends WidgetFocusMetaData {
  InitVoicesSettingCloseWidgetMetaData({
    required super.focusId,
    super.widgetName = '닫기',
    super.parentFocusId = initHeaderSectionFocusId,
    super.sortOrder = 0,
  });
}

class InitVoicesSettingConfirmWidgetMetaData extends WidgetFocusMetaData {
  InitVoicesSettingConfirmWidgetMetaData({
    required super.focusId,
    super.widgetName = '설정하기',
    super.parentFocusId = initHeaderSectionFocusId,
    super.sortOrder = 1,
  });
}
