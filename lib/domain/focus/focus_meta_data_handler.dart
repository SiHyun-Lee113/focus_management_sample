import 'package:barrier_free_test/domain/focus/models/focus_meta_data.dart';



abstract interface class FocusMetaDataHandler<T extends FocusMetaData> {
  void addFocusMetaData(T focusMetaData);

  T? getCurrentFocusMetaData();
  Stream<T> getFocusMetaDataStream();
  void setCurrentFocusMetaDataById(String focusMetaDataId);
  void clearCurrentFocusMetaData();

  T? getRightWidgetFocusMetaData();
  T? getLeftWidgetFocusMetaData();
  T? getUpSectionFocusMetaData();
  T? getDownSectionFocusMetaData();
  T? getChildWidgetFocusMetaData();
  T? getParentFocusMetaData();
}
