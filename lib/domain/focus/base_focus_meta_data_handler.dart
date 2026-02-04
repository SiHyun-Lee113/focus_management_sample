import 'dart:async';

import 'package:barrier_free_test/data/focus_management/focus_id_repository.dart';
import 'package:barrier_free_test/domain/focus/models/focus_meta_data.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';

abstract class BaseFocusMetaDataHandler<T extends FocusMetaData> {
  final StreamController<T> _streamController = StreamController<T>.broadcast();
  T? _currentFocusMetaData;
  final FocusIdRepository _focusIdRepository = FocusIdRepository.instance;

  final Map<String, List<T>> _treeFocusMetaDataMap = {};
  final List<T> _allFocusMetaData = [];
  final Map<String, int> _sortOrderMap = {};

  bool isScreen(T metaData);

  bool isSection(T metaData);

  bool isWidget(T metaData);

  bool isLanguage(T metaData);

  @protected
  List<T> childrenOf(String parentId) => _treeFocusMetaDataMap[parentId] ?? const [];

  @protected
  T findByFocusId(String id) => _allFocusMetaData.firstWhere((e) => e.focusId == id);

  @protected
  void updateCurrentMetaData(T meta) {
    _currentFocusMetaData = meta;
    _streamController.add(meta);
    _focusIdRepository.setFocus(meta.focusId);
  }

  T? _moveInList(List<T> list, String currentId, int offset) {
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

  void addFocusMetaData(T focusMetaData) {
    final parentId = focusMetaData.parentFocusId;
    final siblings = _treeFocusMetaDataMap.putIfAbsent(parentId, () => <T>[]);

    _sortOrderMap[focusMetaData.focusId] = siblings.length;
    siblings.add(focusMetaData);
    _allFocusMetaData.add(focusMetaData);

    _sort();
  }

  void clearCurrentFocusMetaData() {
    _treeFocusMetaDataMap.clear();
    _allFocusMetaData.clear();
    _sortOrderMap.clear();
    _currentFocusMetaData = null;
    _focusIdRepository.clear();
  }

  T? getCurrentFocusMetaData() => _currentFocusMetaData;

  Stream<T> getFocusMetaDataStream() => _streamController.stream;

  void setCurrentFocusMetaDataById(String id) {
    updateCurrentMetaData(findByFocusId(id));
  }

  T? getDownSectionFocusMetaData() => _moveSection(1);

  T? getUpSectionFocusMetaData() => _moveSection(-1);

  T? _moveSection(int offset) {
    if (_currentFocusMetaData == null) throw Exception('currentFocusMetaData is null');

    final current = _currentFocusMetaData!;

    if (isScreen(current)) {
      final next = childrenOf(current.focusId).firstOrNull;
      if (next != null) updateCurrentMetaData(next);
      return next;
    }

    if (isSection(current)) {
      final list = childrenOf(current.parentFocusId);
      final next = _moveInList(list, current.focusId, offset);
      if (next != null) updateCurrentMetaData(next);
      return next;
    }

    if (isWidget(current) || isLanguage(current)) {
      final parent = findByFocusId(current.parentFocusId);
      _currentFocusMetaData = parent;
      return _moveSection(offset);
    }

    return null;
  }

  T? getLeftWidgetFocusMetaData() => _moveWidget(-1);

  T? getRightWidgetFocusMetaData() => _moveWidget(1);

  T? _moveWidget(int offset) {
    if (_currentFocusMetaData == null) throw Exception('currentFocusMetaData is null');
    if (!isWidget(_currentFocusMetaData!) && !isLanguage(_currentFocusMetaData!)) return null;

    final current = _currentFocusMetaData!;
    final list = childrenOf(current.parentFocusId);
    final next = _moveInList(list, current.focusId, offset);
    if (next != null) updateCurrentMetaData(next);
    return next;
  }

  T? getChildWidgetFocusMetaData() {
    if (_currentFocusMetaData == null) throw Exception('currentFocusMetaData is null');

    final current = _currentFocusMetaData!;
    if (isScreen(current)) return getDownSectionFocusMetaData();

    if (isSection(current)) {
      final next = childrenOf(current.focusId).firstOrNull;
      if (next != null) updateCurrentMetaData(next);
      return next;
    }

    return null;
  }

  T? getParentFocusMetaData() {
    if (_currentFocusMetaData == null) throw Exception('currentFocusMetaData is null');

    final current = _currentFocusMetaData!;
    if (isSection(current) || isWidget(current) || isLanguage(current)) {
      final parent = findByFocusId(current.parentFocusId);
      updateCurrentMetaData(parent);
      return parent;
    }

    return null;
  }
}
