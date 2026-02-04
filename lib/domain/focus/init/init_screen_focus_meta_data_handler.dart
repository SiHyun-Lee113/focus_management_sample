import 'dart:async';
import 'package:barrier_free_test/enum/focus/init_screen_focus_code.dart';
import 'package:barrier_free_test/presentation/screen/init/model/init_focus_meta_data.dart';
import 'package:collection/collection.dart';

import 'package:barrier_free_test/domain/focus/focus_meta_data_handler.dart';

class InitScreenFocusMetaDataHandler implements FocusMetaDataHandler<InitFocusMetaData> {
  final StreamController<InitFocusMetaData> _streamController =
      StreamController<InitFocusMetaData>.broadcast();

  InitFocusMetaData? _currentFocusMetaData;

  final Map<String, List<InitFocusMetaData>> _treeFocusMetaDataMap = {};
  final List<InitFocusMetaData> _allFocusMetaData = [];
  final Map<String, int> _sortOrderMap = {};

  /* ----------------------------- basic utils ----------------------------- */

  List<InitFocusMetaData> _childrenOf(String parentId) =>
      _treeFocusMetaDataMap[parentId] ?? const [];

  InitFocusMetaData _findByFocusId(String id) =>
      _allFocusMetaData.firstWhere((e) => e.focusId == id);

  void _updateCurrentInitFocusMetaData(InitFocusMetaData meta) {
    _currentFocusMetaData = meta;
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
    _currentFocusMetaData = null;
  }

  @override
  InitFocusMetaData? getCurrentFocusMetaData() => _currentFocusMetaData;

  @override
  Stream<InitFocusMetaData> getFocusMetaDataStream() => _streamController.stream;

  @override
  void setCurrentFocusMetaDataById(String id, {bool ttsMute = false}) {
    InitFocusMetaData metaData = _findByFocusId(id);

    if (ttsMute) {
      metaData = metaData.copyWith(ttsMute: true);
    }

    _updateCurrentInitFocusMetaData(metaData);
  }

  /* ----------------------------- navigation ----------------------------- */

  @override
  InitFocusMetaData? getDownSectionFocusMetaData() => _moveSection(1);

  @override
  InitFocusMetaData? getUpSectionFocusMetaData() => _moveSection(-1);

  InitFocusMetaData? _moveSection(int offset) {
    if (_currentFocusMetaData == null) throw Exception('currentFocusMetaData is null');

    if (_currentFocusMetaData is ScreenLevel) {
      final next = _childrenOf(_currentFocusMetaData!.focusId).firstOrNull;
      if (next != null) _updateCurrentInitFocusMetaData(next);
      return next;
    }

    if (_currentFocusMetaData is SectionLevel) {
      final section = _currentFocusMetaData as SectionLevel;
      final list = _childrenOf(section.parentFocusId);
      final next = _moveInList(list, section.focusId, offset);
      if (next != null) _updateCurrentInitFocusMetaData(next);
      return next;
    }

    if (_currentFocusMetaData is WidgetLevel) {
      final section = _findByFocusId(_currentFocusMetaData!.parentFocusId) as SectionLevel;
      // _updateCurrentInitFocusMetaData(section);
      _currentFocusMetaData = section;
      return _moveSection(offset);
    }

    if (_currentFocusMetaData is LanguageLevel) {
      final section = _findByFocusId(_currentFocusMetaData!.parentFocusId) as SectionLevel;
      // _updateCurrentInitFocusMetaData(section);
      _currentFocusMetaData = section;
      return _moveSection(offset);
    }

    return null;
  }

  @override
  InitFocusMetaData? getLeftWidgetFocusMetaData() => _moveWidget(-1);

  @override
  InitFocusMetaData? getRightWidgetFocusMetaData() => _moveWidget(1);

  InitFocusMetaData? _moveWidget(int offset) {
    if (_currentFocusMetaData is! WidgetLevel && _currentFocusMetaData is! LanguageLevel) return null;

    final current = _currentFocusMetaData!;
    final list = _childrenOf(current.parentFocusId);

    final next = _moveInList(list, current.focusId, offset);
    if (next != null) _updateCurrentInitFocusMetaData(next);
    return next;
  }

  @override
  InitFocusMetaData? getChildWidgetFocusMetaData() {
    if (_currentFocusMetaData == null) throw Exception('currentFocusMetaData is null');

    if (_currentFocusMetaData is ScreenLevel) return getDownSectionFocusMetaData();

    if (_currentFocusMetaData is SectionLevel) {
      final next = _childrenOf(_currentFocusMetaData!.focusId).firstOrNull;
      if (next != null) _updateCurrentInitFocusMetaData(next);
      return next;
    }

    return null;
  }

  @override
  InitFocusMetaData? getParentFocusMetaData() {
    if (_currentFocusMetaData == null) throw Exception('currentFocusMetaData is null');

    if (_currentFocusMetaData is SectionLevel) {
      final parent = _findByFocusId(_currentFocusMetaData!.parentFocusId) as ScreenLevel;
      _updateCurrentInitFocusMetaData(parent);
      return parent;
    }

    if (_currentFocusMetaData is WidgetLevel) {
      final parent = _findByFocusId(_currentFocusMetaData!.parentFocusId) as SectionLevel;
      _updateCurrentInitFocusMetaData(parent);
      return parent;
    }

    if (_currentFocusMetaData is LanguageLevel) {
      final parent = _findByFocusId(_currentFocusMetaData!.parentFocusId) as SectionLevel;
      _updateCurrentInitFocusMetaData(parent);
      return parent;
    }

    return null;
  }

  String getLanguageFocusMetaDataId(String languageName) {
    InitFocusMetaData? language = _allFocusMetaData.firstWhereOrNull(
      (e) => e is LanguageLevel && e.languageName == languageName,
    );

    if (language == null) throw Exception('languageId is null $languageName');

    return language.focusId;
  }

  String getFocusMetaDataIdByFocusCode(InitScreenFocusCode focusCode) {
    switch (focusCode) {
      case InitScreenFocusCode.screen:
        return InitFocusMetaData.initScreenFocusId;

      case InitScreenFocusCode.section_header:
        return InitFocusMetaData.initHeaderSectionFocusId;

      case InitScreenFocusCode.section_start_order:
        return InitFocusMetaData.initStartOrderSectionFocusId;

      case InitScreenFocusCode.section_language:
        return InitFocusMetaData.initLanguageSectionFocusId;

      case InitScreenFocusCode.widget_home:
        return InitFocusMetaData.initHomeButtonFocusId;

      case InitScreenFocusCode.widget_call_agent:
        return InitFocusMetaData.initCallAgentButtonFocusId;

      case InitScreenFocusCode.widget_start_order:
        return InitFocusMetaData.initStartOrderButtonFocusId;

      case _:
        throw UnimplementedError();
    }
  }
}
