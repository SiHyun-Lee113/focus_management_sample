import 'package:barrier_free_test/domain/focus/models/focus_meta_data.dart';

abstract class KeyboardEventHandler {
  void setCurrentFocusMetaData(FocusMetaData focusMetaData);
  void onRightArrowPressed();
  void onLeftArrowPressed();
  void onUpArrowPressed();
  void onDownArrowPressed();

  void onEnterPressed();
  void onCancelPressed();

  void onKeyPadPressed(String key);
}
