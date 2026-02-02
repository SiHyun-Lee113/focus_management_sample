import 'package:barrier_free_test/domain/focus/models/focus_meta_data.dart';
import 'package:barrier_free_test/domain/focus/focus_meta_data_handler.dart';
import 'package:barrier_free_test/domain/keyboard_event_handler/keyboard_event_handler.dart';

/// initScreen 기준
class KeyboardEventHandlerImpl extends KeyboardEventHandler {
  final FocusMetaDataHandler focusMetaDataHandler;

  KeyboardEventHandlerImpl(this.focusMetaDataHandler);


  @override
  void onCancelPressed() {
    // TODO: implement onCancelPressed
  }

  @override
  void onDownArrowPressed() {
    // TODO: implement onDownArrowPressed
  }

  @override
  void onEnterPressed() {
    // TODO: implement onEnterPressed
  }

  @override
  void onKeyPadPressed(String key) {
    // TODO: implement onKeyPadPressed
  }

  @override
  void onLeftArrowPressed() {
    // TODO: implement onLeftArrowPressed
  }

  @override
  void onRightArrowPressed() {
    // TODO: implement onRightArrowPressed
  }

  @override
  void onUpArrowPressed() {
    // TODO: implement onUpArrowPressed
  }

  @override
  void setCurrentFocusMetaData(FocusMetaData focusMetaData) {
    // TODO: implement setCurrentFocusMetaData
  }
}