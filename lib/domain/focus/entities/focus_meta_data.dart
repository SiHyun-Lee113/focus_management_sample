import 'package:barrier_free_test/domain/focus/entities/widget_type.dart';

class FocusMetaData {
  final String parentFocusId;
  final String focusId;
  final int sortOrder;

  FocusMetaData({required this.parentFocusId, required this.focusId, required this.sortOrder});

  @override
  String toString() {
    return 'parentFocusId: $parentFocusId, focusId: $focusId, sortOrder: $sortOrder';
  }
}

class ScreenFocusMetaData extends FocusMetaData {
  final String screenName;

  ScreenFocusMetaData({
    super.parentFocusId = 'screen is parent',
    required super.focusId,
    required super.sortOrder,
    required this.screenName,
  });

  factory ScreenFocusMetaData.init() {
    return ScreenFocusMetaData(focusId: 'init', screenName: 'init', sortOrder: 0);
  }
}

class SectionFocusMetaData extends FocusMetaData {
  final String sectionName;

  SectionFocusMetaData({
    required super.parentFocusId,
    required super.focusId,
    required super.sortOrder,
    required this.sectionName,
  });

  /// common
  factory SectionFocusMetaData.header() {
    return SectionFocusMetaData(
      focusId: 'header',
      parentFocusId: ScreenFocusMetaData.init().focusId,
      sectionName: 'Header',
      sortOrder: 0,
    );
  }

  factory SectionFocusMetaData.footer() {
    return SectionFocusMetaData(
      focusId: 'footer',
      parentFocusId: ScreenFocusMetaData.init().focusId,
      sectionName: 'Footer',
      sortOrder: 0,
    );
  }

  /// init
  factory SectionFocusMetaData.startOrder() {
    return SectionFocusMetaData(
      focusId: 'startOrder',
      parentFocusId: ScreenFocusMetaData.init().focusId,
      sectionName: 'startOrder',
      sortOrder: 1,
    );
  }

  factory SectionFocusMetaData.language() {
    return SectionFocusMetaData(
      focusId: 'language',
      parentFocusId: ScreenFocusMetaData.init().focusId,
      sectionName: 'language',
      sortOrder: 2,
    );
  }

  factory SectionFocusMetaData.voicesSetting() {
    return SectionFocusMetaData(
      focusId: 'voicesSetting',
      parentFocusId: ScreenFocusMetaData.init().focusId,
      sectionName: 'voicesSetting',
      sortOrder: 3,
    );
  }

  factory SectionFocusMetaData.voicesDecibelSetting() {
    return SectionFocusMetaData(
      focusId: 'voicesDecibelSetting',
      parentFocusId: SectionFocusMetaData.voicesSetting().focusId,
      sectionName: 'voicesDecibelSetting',
      sortOrder: 0,
    );
  }

  factory SectionFocusMetaData.voicesSpeedSetting() {
    return SectionFocusMetaData(
      focusId: 'voicesSpeedSetting',
      parentFocusId: SectionFocusMetaData.voicesSetting().focusId,
      sectionName: 'voicesSpeedSetting',
      sortOrder: 1,
    );
  }

  /// 스크린별 섹션 정의
  static List<SectionFocusMetaData> initScreenSectionMetaDataList() {
    return [
      SectionFocusMetaData.header(),
      SectionFocusMetaData.startOrder(),
      SectionFocusMetaData.language(),
      SectionFocusMetaData.voicesSetting(),
      SectionFocusMetaData.voicesDecibelSetting(),
      SectionFocusMetaData.voicesSpeedSetting(),
      SectionFocusMetaData.footer(),
    ];
  }
}

class WidgetFocusMetaData extends FocusMetaData {
  final String widgetName;
  final InitScreenWidgetActionType? widgetActionType;

  WidgetFocusMetaData({
    required super.focusId,
    required super.sortOrder,
    required this.widgetName,
    required super.parentFocusId,
    this.widgetActionType,
  });
}
