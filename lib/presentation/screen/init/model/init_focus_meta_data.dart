import 'package:barrier_free_test/domain/focus/models/focus_meta_data.dart';
import 'package:barrier_free_test/enum/focus/init_screen_focus_code.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'init_focus_meta_data.freezed.dart';

@freezed
sealed class InitFocusMetaData with _$InitFocusMetaData implements FocusMetaData{
  const InitFocusMetaData._();

  const factory InitFocusMetaData.screen({
    @Default(InitScreenFocusCode.screen) InitScreenFocusCode focusCode,
    required String focusId,
    @Default('initScreen') String parentFocusId,
    required String screenName,
  }) = ScreenLevel;

  const factory InitFocusMetaData.section({
    required InitScreenFocusCode focusCode,
    required String focusId,
    required String parentFocusId,
    required String sectionName,
  }) = SectionLevel;

  const factory InitFocusMetaData.widget({
    required InitScreenFocusCode focusCode,
    required String focusId,
    required String parentFocusId,
    required String widgetName,
  }) = WidgetLevel;

  const factory InitFocusMetaData.language({
    @Default(InitScreenFocusCode.widget_language) InitScreenFocusCode focusCode,
    required String focusId,
    required String parentFocusId,
    required String languageName,
  }) = LanguageLevel;

  static final String initScreenFocusId = 'initScreenFocusId';
  static final String initHeaderSectionFocusId = 'initHeaderId';
  static final String initStartOrderSectionFocusId = 'initStartOrderFocusId';
  static final String initLanguageSectionFocusId = 'initLanguageFocusId';
  static final String initHomeButtonFocusId = 'initHomeButtonFocusId';
  static final String initCallAgentButtonFocusId = 'initCallAgentButtonFocusId';
  static final String initStartOrderButtonFocusId = 'initStartOrderButtonFocusId';

  static List<InitFocusMetaData> defaultFocusMetaDataList() {
    return  [
      InitFocusMetaData.screen(focusId: initScreenFocusId, screenName: '초기 설정 화면'),
      InitFocusMetaData.section(
        focusCode: InitScreenFocusCode.section_header,
        focusId: InitFocusMetaData.initHeaderSectionFocusId,
        parentFocusId: initScreenFocusId,
        sectionName: '상단 영역',
      ),
      InitFocusMetaData.widget(
        focusCode: InitScreenFocusCode.widget_home,
        focusId: initHomeButtonFocusId,
        parentFocusId: initHeaderSectionFocusId,
        widgetName: '처음으로',
      ),
      InitFocusMetaData.widget(
        focusCode: InitScreenFocusCode.widget_call_agent,
        focusId: initCallAgentButtonFocusId,
        parentFocusId: initHeaderSectionFocusId,
        widgetName: '직원호출',
      ),
      InitFocusMetaData.section(
        focusCode: InitScreenFocusCode.section_start_order,
        focusId: initStartOrderSectionFocusId,
        parentFocusId: initScreenFocusId,
        sectionName: '주문 영역',
      ),
      InitFocusMetaData.widget(
        focusCode: InitScreenFocusCode.widget_start_order,
        focusId: initStartOrderButtonFocusId,
        parentFocusId: initStartOrderSectionFocusId,
        widgetName: '주문 하기',
      ),
      InitFocusMetaData.section(
        focusCode: InitScreenFocusCode.section_language,
        focusId: initLanguageSectionFocusId,
        parentFocusId: initScreenFocusId,
        sectionName: '언어 영역',
      ),
    ];
  }

}