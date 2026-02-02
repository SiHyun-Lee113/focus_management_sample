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
  }) = Screen;

  const factory InitFocusMetaData.section({
    required InitScreenFocusCode focusCode,
    required String focusId,
    required String parentFocusId,
    required String sectionName,
  }) = Section;

  const factory InitFocusMetaData.widget({
    required InitScreenFocusCode focusCode,
    required String focusId,
    required String parentFocusId,
    required String widgetName,
  }) = Widget;

  const factory InitFocusMetaData.language({
    @Default(InitScreenFocusCode.widget_language) InitScreenFocusCode focusCode,
    required String focusId,
    required String parentFocusId,
    required String languageName,
  }) = Language;
}