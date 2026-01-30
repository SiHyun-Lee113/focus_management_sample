import 'package:barrier_free_test/domain/focus/entities/focus_meta_data.dart';

abstract interface class FocusMetaDataHandler {
  void addFocusMetaData(FocusMetaData focusMetaData);

  FocusMetaData? getCurrentFocusMetaData();
  Stream<FocusMetaData> getFocusMetaDataStream();
  void setCurrentScreenFocusMetaDataById(String focusMetaDataId);
  void setCurrentSectionFocusMetaDataById(String focusMetaDataId);
  void setCurrentWidgetFocusMetaDataById(String focusMetaDataId);
  void clearCurrentFocusMetaData();

  FocusMetaData? getRightFocusMetaData();
  FocusMetaData? getLeftFocusMetaData();
  FocusMetaData? getUpFocusMetaData();
  FocusMetaData? getDownFocusMetaData();
}
