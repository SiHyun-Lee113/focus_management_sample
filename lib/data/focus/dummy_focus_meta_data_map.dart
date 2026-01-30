import 'package:barrier_free_test/domain/focus/entities/focus_meta_data.dart';
import 'package:barrier_free_test/domain/focus/entities/init_screen_focus_meta_data.dart';
import 'package:barrier_free_test/domain/focus/entities/widget_type.dart';

/// init 기준
/// screen > section > widget
Map<String, List<String>> getDummyFocusIdMap() {
  /// screen
  final screen = ScreenFocusMetaData.init();

  /// lv.1 section
  final sectionHeader = SectionFocusMetaData.header();
  final sectionStartOrder = SectionFocusMetaData.startOrder();
  final sectionLanguage = SectionFocusMetaData.language();
  final sectionVoicesSetting = SectionFocusMetaData.voicesSetting();

  /// lv.2 section
  final sectionVoicesDecibelSetting = SectionFocusMetaData.voicesDecibelSetting();
  final sectionVoicesSpeedSetting = SectionFocusMetaData.voicesSpeedSetting();

  /// lv.3 widget
  final widgetCallManager = WidgetFocusMetaData(
    focusId: 'callManager',
    widgetName: '직원호출',
    parentFocusId: sectionHeader.focusId,
    widgetActionType: InitScreenWidgetActionType.callManager,
    sortOrder: 0,
  );
  final widgetOrder = WidgetFocusMetaData(
    focusId: 'order',
    widgetName: '주문하기',
    parentFocusId: sectionStartOrder.focusId,
    widgetActionType: InitScreenWidgetActionType.order,
    sortOrder: 0,
  );
  final widgetLanguageKr = WidgetFocusMetaData(
    focusId: 'languageKr',
    widgetName: '한국어',
    parentFocusId: sectionLanguage.focusId,
    widgetActionType: InitScreenWidgetActionType.language,
    sortOrder: 0,
  );
  final widgetLanguageEn = WidgetFocusMetaData(
    focusId: 'languageEn',
    widgetName: '영어',
    parentFocusId: sectionLanguage.focusId,
    widgetActionType: InitScreenWidgetActionType.language,
    sortOrder: 1,
  );
  final widgetLanguageZh = WidgetFocusMetaData(
    focusId: 'languageZh',
    widgetName: '중국어',
    parentFocusId: sectionLanguage.focusId,
    widgetActionType: InitScreenWidgetActionType.language,
    sortOrder: 2,
  );
  final widgetLanguageJp = WidgetFocusMetaData(
    focusId: 'languageJp',
    widgetName: '일어',
    parentFocusId: sectionLanguage.focusId,
    widgetActionType: InitScreenWidgetActionType.language,
    sortOrder: 3,
  );
  final widgetVoicesSettingConfirm = WidgetFocusMetaData(
    focusId: 'voicesSettingConfirm',
    widgetName: '확인',
    parentFocusId: sectionVoicesSetting.focusId,
    widgetActionType: InitScreenWidgetActionType.voicesSetting,
    sortOrder: 0,
  );

  return {
    screen.focusId: [sectionHeader.focusId, sectionStartOrder.focusId, sectionLanguage.focusId, sectionVoicesSetting.focusId],
    sectionHeader.focusId: [widgetCallManager.focusId],
    sectionStartOrder.focusId: [widgetOrder.focusId],
    sectionLanguage.focusId: [widgetLanguageKr.focusId, widgetLanguageEn.focusId, widgetLanguageZh.focusId, widgetLanguageJp.focusId],
    sectionVoicesSetting.focusId: [sectionVoicesDecibelSetting.focusId, sectionVoicesSpeedSetting.focusId, widgetVoicesSettingConfirm.focusId],
  };
}

Map<String, List<String>> getDummyFocusMetaDataMap2() {
  final screen = InitScreenFocusMetaData();

  final sectionHeader = InitHeaderSectionMetaData();
  final sectionStartOrder = InitStartOrderSectionMetaData();
  final sectionLanguage = InitLanguageSectionMetaData();
  final sectionVoicesSetting = InitVoicesSettingDialogSectionMetaData();

  final sectionVoicesDecibelSetting = InitVoicesDecibelSettingSectionMetaData();
  final sectionVoicesSpeedSetting = InitVoicesSpeedSettingSectionMetaData();
  final sectionVoicesSettingConfirm = InitVoicesSettingConfirmSectionMetaData();

  final widgetCallManager = InitCallManagerWidgetMetaData(focusId: 'callManager');
  final widgetOrder = InitStartOrderWidgetMetaData(focusId: 'order');
  final widgetLanguageKr = InitLanguageWidgetMetaData(focusId: 'languageKr', widgetName: '한국어', sortOrder: 0);
  final widgetLanguageEn = InitLanguageWidgetMetaData(focusId: 'languageEn', widgetName: '영어', sortOrder: 0);
  final widgetLanguageZh = InitLanguageWidgetMetaData(focusId: 'languageZh', widgetName: '중국어', sortOrder: 0);
  final widgetLanguageJp = InitLanguageWidgetMetaData(focusId: 'languageJp', widgetName: '일어', sortOrder: 0);
  final widgetVoicesDecibelDecrease = InitDecibelDecreaseWidgetMetaData(focusId: 'voicesDecibelDecrease');
  final widgetVoicesDecibelIncrease = InitDecibelIncreaseWidgetMetaData(focusId: 'voicesDecibelIncrease');
  final widgetVoicesSpeedDecrease = InitSpeedDecreaseWidgetMetaData(focusId: 'voicesSpeedDecrease');
  final widgetVoicesSpeedIncrease = InitSpeedIncreaseWidgetMetaData(focusId: 'voicesSpeedIncrease');
  final widgetVoicesSettingClose = InitVoicesSettingCloseWidgetMetaData(focusId: 'voicesSettingClose');
  final widgetVoicesSettingConfirm = InitVoicesSettingConfirmWidgetMetaData(focusId: 'voicesSettingConfirm');

  return {
    screen.focusId: [sectionHeader.focusId, sectionStartOrder.focusId, sectionLanguage.focusId, sectionVoicesSetting.focusId],
    sectionHeader.focusId: [widgetCallManager.focusId],
    sectionStartOrder.focusId: [widgetOrder.focusId],
    sectionLanguage.focusId: [widgetLanguageKr.focusId, widgetLanguageEn.focusId, widgetLanguageZh.focusId, widgetLanguageJp.focusId],
    sectionVoicesSetting.focusId: [sectionVoicesDecibelSetting.focusId, sectionVoicesSpeedSetting.focusId, sectionVoicesSettingConfirm.focusId],
    sectionVoicesDecibelSetting.focusId: [widgetVoicesDecibelDecrease.focusId, widgetVoicesDecibelIncrease.focusId],
    sectionVoicesSpeedSetting.focusId: [widgetVoicesSpeedDecrease.focusId, widgetVoicesSpeedIncrease.focusId],
    sectionVoicesSettingConfirm.focusId: [widgetVoicesSettingClose.focusId, widgetVoicesSettingConfirm.focusId],
  };
}

List<FocusMetaData> getDummyFocusMetaDataList() {
  final screen = InitScreenFocusMetaData();

  final sectionHeader = InitHeaderSectionMetaData();
  final sectionStartOrder = InitStartOrderSectionMetaData();
  final sectionLanguage = InitLanguageSectionMetaData();
  final sectionVoicesSetting = InitVoicesSettingDialogSectionMetaData();

  final sectionVoicesDecibelSetting = InitVoicesDecibelSettingSectionMetaData();
  final sectionVoicesSpeedSetting = InitVoicesSpeedSettingSectionMetaData();
  final sectionVoicesSettingConfirm = InitVoicesSettingConfirmSectionMetaData();

  final widgetCallManager = InitCallManagerWidgetMetaData(focusId: 'callManager');
  final widgetOrder = InitStartOrderWidgetMetaData(focusId: 'order');
  final widgetLanguageKr = InitLanguageWidgetMetaData(focusId: 'languageKr', widgetName: '한국어', sortOrder: 0);
  final widgetLanguageEn = InitLanguageWidgetMetaData(focusId: 'languageEn', widgetName: '영어', sortOrder: 0);
  final widgetLanguageZh = InitLanguageWidgetMetaData(focusId: 'languageZh', widgetName: '중국어', sortOrder: 0);
  final widgetLanguageJp = InitLanguageWidgetMetaData(focusId: 'languageJp', widgetName: '일어', sortOrder: 0);
  final widgetVoicesDecibelDecrease = InitDecibelDecreaseWidgetMetaData(focusId: 'voicesDecibelDecrease');
  final widgetVoicesDecibelIncrease = InitDecibelIncreaseWidgetMetaData(focusId: 'voicesDecibelIncrease');
  final widgetVoicesSpeedDecrease = InitSpeedDecreaseWidgetMetaData(focusId: 'voicesSpeedDecrease');
  final widgetVoicesSpeedIncrease = InitSpeedIncreaseWidgetMetaData(focusId: 'voicesSpeedIncrease');
  final widgetVoicesSettingClose = InitVoicesSettingCloseWidgetMetaData(focusId: 'voicesSettingClose');
  final widgetVoicesSettingConfirm = InitVoicesSettingConfirmWidgetMetaData(focusId: 'voicesSettingConfirm');

  return [
    screen,
    sectionHeader,
    sectionStartOrder,
    sectionLanguage,
    sectionVoicesSetting,
    sectionVoicesDecibelSetting,
    sectionVoicesSpeedSetting,
    sectionVoicesSettingConfirm,
    widgetCallManager,
    widgetOrder,
    widgetLanguageKr,
    widgetLanguageEn,
    widgetLanguageZh,
    widgetLanguageJp,
    widgetVoicesDecibelDecrease,
    widgetVoicesDecibelIncrease,
    widgetVoicesSpeedDecrease,
    widgetVoicesSpeedIncrease,
    widgetVoicesSettingClose,
    widgetVoicesSettingConfirm,
  ];
}
