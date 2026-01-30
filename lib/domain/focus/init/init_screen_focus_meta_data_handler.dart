import 'dart:async';
import 'package:collection/collection.dart';

import 'package:barrier_free_test/data/focus/dummy_focus_meta_data_map.dart';
import 'package:barrier_free_test/domain/focus/entities/focus_meta_data.dart';
import 'package:barrier_free_test/domain/focus/focus_meta_data_handler.dart';

class InitScreenFocusMetaDataHandler implements FocusMetaDataHandler {
  final StreamController<FocusMetaData> _focusMetaDataStreamController =
      StreamController<FocusMetaData>.broadcast();
  FocusMetaData? _currentFocusMetaData;

  /// 이렇게 가지고 있으면 화면 위치에 따른 순서가 보장되나?
  /// FocusMetaData에 정렬 순서를 체크할 수 있는 필드 추가 검토
  Map<String, List<FocusMetaData>> _screenFocusMetaDataMap = {};
  List<FocusMetaData> _focusMetaDataList = [];


  InitScreenFocusMetaDataHandler() {
    _initResource();
  }

  void _initResource() {
    List<FocusMetaData> focusMetaDataList = getDummyFocusMetaDataList();

    for (var focusMetaData in focusMetaDataList) {
      addFocusMetaData(focusMetaData);
    }

    FocusMetaData? screenFocusMetaData = _focusMetaDataList.firstWhereOrNull((focusMetaData) => focusMetaData is ScreenFocusMetaData);

    if (screenFocusMetaData == null) {
      throw Exception('screenFocusMetaData is null');
    }

    setCurrentScreenFocusMetaDataById(screenFocusMetaData.focusId);
  }

  @override
  void addFocusMetaData(FocusMetaData focusMetaData) {
    _screenFocusMetaDataMap
        .putIfAbsent(focusMetaData.parentFocusId, () => <FocusMetaData>[])
        .add(focusMetaData);

    _focusMetaDataList.add(focusMetaData);

    _sortFocusMetaDataMap();
  }

  @override
  void clearCurrentFocusMetaData() {
    _screenFocusMetaDataMap = {};
    _focusMetaDataList = [];
  }

  @override
  FocusMetaData? getCurrentFocusMetaData() {
    return _currentFocusMetaData;
  }

  @override
  Stream<FocusMetaData> getFocusMetaDataStream() => _focusMetaDataStreamController.stream;

  @override
  void setCurrentScreenFocusMetaDataById(String focusMetaDataId) {
    FocusMetaData? focusMetaData = _focusMetaDataList.firstWhereOrNull((e) => e.focusId == focusMetaDataId);
    if (focusMetaData == null) {
      throw Exception('focusMetaData is null');
    }

    if (focusMetaData is! ScreenFocusMetaData) {
      throw Exception('focusMetaData is not ScreenFocusMetaData\nfocusMetaData: $focusMetaData');
    }

    _currentFocusMetaData = focusMetaData;
    _focusMetaDataStreamController.add(focusMetaData);
  }

  @override
  void setCurrentSectionFocusMetaDataById(String focusMetaDataId) {
    FocusMetaData? focusMetaData = _focusMetaDataList.firstWhereOrNull((e) => e.focusId == focusMetaDataId);
    if (focusMetaData == null) {
      throw Exception('focusMetaData is null');
    }

    if (focusMetaData is! SectionFocusMetaData) {
      throw Exception('focusMetaData is not SectionFocusMetaData\nfocusMetaData: $focusMetaData');
    }

    _currentFocusMetaData = focusMetaData;
    _focusMetaDataStreamController.add(focusMetaData);
  }

  @override
  void setCurrentWidgetFocusMetaDataById(String focusMetaDataId) {
    // TODO: implement setCurrentWidgetFocusMetaData
  }



  @override
  FocusMetaData? getDownFocusMetaData() {
    if (_currentFocusMetaData == null) {
      return null;
    }

    // 해당 위젯의 섹션(부모)의 리스트 find
    List<FocusMetaData>? focusMetaDataList = _screenFocusMetaDataMap[_currentFocusMetaData!.parentFocusId];

    // null이면 오류 throw
    if (focusMetaDataList == null || focusMetaDataList.isEmpty) {
      throw Exception('해당 포커스가 포함된 섹션이 없습니다. focusData: $_currentFocusMetaData');
    }
    // 리스트 길이가 하나면 null
    if (focusMetaDataList.length == 1) {
      return null;
    }

    // 리스트 아래(data.sortOrder 기준) 찾기
    // 없으면 맨 위 찾기
  }

  @override
  FocusMetaData? getLeftFocusMetaData() {
    // TODO: implement getLeftFocusMetaData
    throw UnimplementedError();
  }

  @override
  FocusMetaData? getRightFocusMetaData() {
    // TODO: implement getRightFocusMetaData
    throw UnimplementedError();
  }

  @override
  FocusMetaData? getUpFocusMetaData() {
    // TODO: implement getUpFocusMetaData
    throw UnimplementedError();
  }

  void _sortFocusMetaDataMap() {
    _screenFocusMetaDataMap.forEach((key, list) {
      list.sort((a, b) => b.sortOrder.compareTo(a.sortOrder));
    });
  }
}