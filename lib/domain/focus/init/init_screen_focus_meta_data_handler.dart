import 'dart:async';
import 'package:barrier_free_test/presentation/screen/init/model/init_focus_meta_data.dart';
import 'package:collection/collection.dart';

import 'package:barrier_free_test/domain/focus/focus_meta_data_handler.dart';

class InitScreenFocusMetaDataHandler implements FocusMetaDataHandler<InitFocusMetaData> {
  final StreamController<InitFocusMetaData> _streamController =
      StreamController<InitFocusMetaData>.broadcast();

  InitFocusMetaData? _currentInitFocusMetaData;

  final Map<String, List<InitFocusMetaData>> _treeFocusMetaDataMap = {};
  final List<InitFocusMetaData> _allFocusMetaData = [];
  final Map<String, int> _sortOrderMap = {};

  /* ----------------------------- basic utils ----------------------------- */

  List<InitFocusMetaData> _childrenOf(String parentId) =>
      _treeFocusMetaDataMap[parentId] ?? const [];

  InitFocusMetaData _findByFocusId(String id) =>
      _allFocusMetaData.firstWhere((e) => e.focusId == id);

  void _updateCurrentInitFocusMetaData(InitFocusMetaData meta) {
    _currentInitFocusMetaData = meta;
    _streamController.add(meta);
  }

  InitFocusMetaData? _moveInList(List<InitFocusMetaData> list, String currentId, int offset) {
    if (list.isEmpty) return null;
    final index = list.indexWhere((e) => e.focusId == currentId);
    if (index == -1) return null;
    final next = (index + offset) % list.length;
    return list[next < 0 ? next + list.length : next];
  }

  void _sort() {
    _treeFocusMetaDataMap.forEach((_, list) {
      list.sort((a, b) => (_sortOrderMap[a.focusId] ?? 0).compareTo(_sortOrderMap[b.focusId] ?? 0));
    });
  }

  /* ----------------------------- interface ----------------------------- */

  @override
  void addFocusMetaData(InitFocusMetaData initFocusMetaData) {
    final parentId = initFocusMetaData.parentFocusId;
    final siblings = _treeFocusMetaDataMap.putIfAbsent(parentId, () => <InitFocusMetaData>[]);

    _sortOrderMap[initFocusMetaData.focusId] = siblings.length;
    siblings.add(initFocusMetaData);
    _allFocusMetaData.add(initFocusMetaData);

    _sort();
  }

  @override
  void clearCurrentFocusMetaData() {
    _treeFocusMetaDataMap.clear();
    _allFocusMetaData.clear();
    _sortOrderMap.clear();
    _currentInitFocusMetaData = null;
  }

  @override
  InitFocusMetaData? getCurrentFocusMetaData() => _currentInitFocusMetaData;

  @override
  Stream<InitFocusMetaData> getFocusMetaDataStream() => _streamController.stream;

  @override
  void setCurrentScreenFocusMetaDataById(String id) =>
      _updateCurrentInitFocusMetaData(_findByFocusId(id) as Screen);

  @override
  void setCurrentSectionFocusMetaDataById(String id) =>
      _updateCurrentInitFocusMetaData(_findByFocusId(id) as Section);

  @override
  void setCurrentWidgetFocusMetaDataById(String id) =>
      _updateCurrentInitFocusMetaData(_findByFocusId(id) as Widget);

  /* ----------------------------- navigation ----------------------------- */

  @override
  InitFocusMetaData? getDownSectionFocusMetaData() => _moveSection(1);

  @override
  InitFocusMetaData? getUpSectionFocusMetaData() => _moveSection(-1);

  InitFocusMetaData? _moveSection(int offset) {
    if (_currentInitFocusMetaData == null) throw Exception('currentFocusMetaData is null');

    if (_currentInitFocusMetaData is Screen) {
      final next = _childrenOf(_currentInitFocusMetaData!.focusId).firstOrNull;
      if (next != null) _updateCurrentInitFocusMetaData(next);
      return next;
    }

    if (_currentInitFocusMetaData is Section) {
      final section = _currentInitFocusMetaData as Section;
      final list = _childrenOf(section.parentFocusId);
      final next = _moveInList(list, section.focusId, offset);
      if (next != null) _updateCurrentInitFocusMetaData(next);
      return next;
    }

    if (_currentInitFocusMetaData is Widget) {
      final section = _findByFocusId(_currentInitFocusMetaData!.parentFocusId) as Section;
      _updateCurrentInitFocusMetaData(section);
      return _moveSection(offset);
    }

    if (_currentInitFocusMetaData is Language) {
      final section = _findByFocusId(_currentInitFocusMetaData!.parentFocusId) as Section;
      _updateCurrentInitFocusMetaData(section);
      return _moveSection(offset);
    }

    return null;
  }

  @override
  InitFocusMetaData? getLeftWidgetFocusMetaData() => _moveWidget(-1);

  @override
  InitFocusMetaData? getRightWidgetFocusMetaData() => _moveWidget(1);

  InitFocusMetaData? _moveWidget(int offset) {
    if (_currentInitFocusMetaData is! Widget && _currentInitFocusMetaData is! Language) return null;

    final current = _currentInitFocusMetaData!;
    final list = _childrenOf(current.parentFocusId);

    final next = _moveInList(list, current.focusId, offset);
    if (next != null) _updateCurrentInitFocusMetaData(next);
    return next;
  }

  @override
  InitFocusMetaData? getChildWidgetFocusMetaData() {
    if (_currentInitFocusMetaData == null) throw Exception('currentFocusMetaData is null');

    if (_currentInitFocusMetaData is Screen) return getDownSectionFocusMetaData();

    if (_currentInitFocusMetaData is Section) {
      final next = _childrenOf(_currentInitFocusMetaData!.focusId).firstOrNull;
      if (next != null) _updateCurrentInitFocusMetaData(next);
      return next;
    }

    return null;
  }

  @override
  InitFocusMetaData? getParentFocusMetaData() {
    if (_currentInitFocusMetaData == null) throw Exception('currentFocusMetaData is null');

    if (_currentInitFocusMetaData is Section) {
      final parent = _findByFocusId(_currentInitFocusMetaData!.parentFocusId) as Screen;
      _updateCurrentInitFocusMetaData(parent);
      return parent;
    }

    if (_currentInitFocusMetaData is Widget) {
      final parent = _findByFocusId(_currentInitFocusMetaData!.parentFocusId) as Section;
      _updateCurrentInitFocusMetaData(parent);
      return parent;
    }

    if (_currentInitFocusMetaData is Language) {
      final parent = _findByFocusId(_currentInitFocusMetaData!.parentFocusId) as Section;
      _updateCurrentInitFocusMetaData(parent);
      return parent;
    }

    return null;
  }
}
