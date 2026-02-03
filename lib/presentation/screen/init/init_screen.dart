import 'package:barrier_free_test/data/tts/flutter_tts_service.dart';
import 'package:barrier_free_test/presentation/screen/init/init_screen_cubit.dart';
import 'package:barrier_free_test/presentation/screen/init/init_screen_cubit_tts_service_extension.dart';
import 'package:barrier_free_test/presentation/screen/init/init_screen_state.dart';
import 'package:barrier_free_test/presentation/screen/init/model/init_screen_tts_scenario_event.dart';
import 'package:barrier_free_test/presentation/widgets/app_focus_traversal_policy.dart';
import 'package:barrier_free_test/presentation/widgets/focus_navigation_controller.dart';
import 'package:barrier_free_test/presentation/widgets/focusable_action_button.dart';
import 'package:barrier_free_test/presentation/widgets/focus_section_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InitScreen extends StatefulWidget {
  const InitScreen({super.key});

  @override
  State<InitScreen> createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  final _cubit = InitScreenCubit(
    InitScreenState(),
    ttsService: FlutterTtsService(),
  );

  final FocusNavigationController _focusController = FocusNavigationController();
  late final AppFocusTraversalPolicy _focusPolicy =
      AppFocusTraversalPolicy(controller: _focusController);

  final FocusNode _homeNode = FocusNode(debugLabel: 'home');
  final FocusNode _callAgentNode = FocusNode(debugLabel: 'callAgent');
  final FocusNode _startOrderNode = FocusNode(debugLabel: 'startOrder');
  final List<FocusNode> _languageNodes = [];

  final FocusNode _headerSectionNode = FocusNode(debugLabel: 'sectionHeader');
  final FocusNode _startOrderSectionNode = FocusNode(debugLabel: 'sectionStartOrder');
  final FocusNode _languageSectionNode = FocusNode(debugLabel: 'sectionLanguage');

  static const String _sectionHeaderId = 'sectionHeader';
  static const String _sectionStartOrderId = 'sectionStartOrder';
  static const String _sectionLanguageId = 'sectionLanguage';

  static const String _homeId = 'headerHome';
  static const String _callAgentId = 'headerCallAgent';
  static const String _startOrderId = 'startOrder';
  static const String _headerSectionFocusId = 'sectionHeaderFocus';
  static const String _startOrderSectionFocusId = 'sectionStartOrderFocus';
  static const String _languageSectionFocusId = 'sectionLanguageFocus';

  String? _currentSectionId;

  @override
  void initState() {
    super.initState();
    _registerStaticNodes();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      _homeNode.requestFocus();
      _cubit.announce(const InitScreenApproach());
    });
  }

  @override
  void dispose() {
    _cubit.close();
    _homeNode.dispose();
    _callAgentNode.dispose();
    _startOrderNode.dispose();
    _headerSectionNode.dispose();
    _startOrderSectionNode.dispose();
    _languageSectionNode.dispose();
    for (final node in _languageNodes) {
      node.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider.value(
        value: _cubit,
        child: BlocConsumer<InitScreenCubit, InitScreenState>(
          builder: (context, state) {
            _syncLanguageNodes(state.languageList);
            return FocusTraversalGroup(
              policy: _focusPolicy,
              child: Shortcuts(
                shortcuts: <ShortcutActivator, Intent>{
                  LogicalKeySet(LogicalKeyboardKey.arrowUp):
                      const DirectionalFocusIntent(TraversalDirection.up),
                  LogicalKeySet(LogicalKeyboardKey.arrowDown):
                      const DirectionalFocusIntent(TraversalDirection.down),
                  LogicalKeySet(LogicalKeyboardKey.arrowLeft):
                      const DirectionalFocusIntent(TraversalDirection.left),
                  LogicalKeySet(LogicalKeyboardKey.arrowRight):
                      const DirectionalFocusIntent(TraversalDirection.right),
                  LogicalKeySet(LogicalKeyboardKey.enter): const ActivateIntent(),
                  LogicalKeySet(LogicalKeyboardKey.space): const ActivateIntent(),
                  LogicalKeySet(LogicalKeyboardKey.escape): const DismissIntent(),
                },
                child: Actions(
                  actions: <Type, Action<Intent>>{
                    DismissIntent: CallbackAction<DismissIntent>(
                      onInvoke: (_) {
                        _handleEscape();
                        return null;
                      },
                    ),
                  },
                  child: Column(
                    children: [
                      _sectionHeader(state),
                      _sectionStartOrder(state),
                      _sectionLanguage(state),
                    ],
                  ),
                ),
              ),
            );
          },
          listener: (context, state) {
            _handleTtsEvent(context, state);
          },
        ),
      ),
    );
  }

  void _handleTtsEvent(BuildContext context, InitScreenState state) {
    final ttsEvent = state.ttsScenarioEvent?.consume();
    if (ttsEvent == null) return;

    _cubit.handelTtsEvent(ttsEvent);
  }

  Widget _sectionHeader(InitScreenState state) {
    return FocusSectionContainer(
      sectionFocusNode: _headerSectionNode,
      padding: const EdgeInsets.all(8.0),
      onActivate: () => _homeNode.requestFocus(),
      onFocusChange: (hasFocus) {
        if (hasFocus) {
          _announceSectionFocus(
            sectionId: _sectionHeaderId,
            sectionEvent: const InitScreenSectionHeader(),
          );
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FocusableActionButton(
            focusNode: _homeNode,
            onPressed: _cubit.navigateHome,
            onFocusChange: (hasFocus) {
              _announceFocus(
                hasFocus: hasFocus,
                sectionId: _sectionHeaderId,
                sectionEvent: const InitScreenSectionHeader(),
                widgetEvent: const InitScreenWidgetHome(),
              );
            },
            child: ElevatedButton(
              onPressed: _cubit.navigateHome,
              child: const Text('처음으로'),
            ),
          ),
          FocusableActionButton(
            focusNode: _callAgentNode,
            onPressed: _cubit.callAgent,
            onFocusChange: (hasFocus) {
              _announceFocus(
                hasFocus: hasFocus,
                sectionId: _sectionHeaderId,
                sectionEvent: const InitScreenSectionHeader(),
                widgetEvent: const InitScreenWidgetCallAgent(),
              );
            },
            child: ElevatedButton(
              onPressed: _cubit.callAgent,
              child: const Text('직원호출'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionStartOrder(InitScreenState state) {
    return FocusSectionContainer(
      sectionFocusNode: _startOrderSectionNode,
      padding: const EdgeInsets.all(8.0),
      onActivate: () => _startOrderNode.requestFocus(),
      onFocusChange: (hasFocus) {
        if (hasFocus) {
          _announceSectionFocus(
            sectionId: _sectionStartOrderId,
            sectionEvent: const InitScreenSectionStartOrder(),
          );
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FocusableActionButton(
            focusNode: _startOrderNode,
            onPressed: _cubit.navigateStartOrder,
            onFocusChange: (hasFocus) {
              _announceFocus(
                hasFocus: hasFocus,
                sectionId: _sectionStartOrderId,
                sectionEvent: const InitScreenSectionStartOrder(),
                widgetEvent: const InitScreenWidgetStartOrder(),
              );
            },
            child: ElevatedButton(
              onPressed: _cubit.navigateStartOrder,
              child: const Text('주문하기'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionLanguage(InitScreenState state) {
    return FocusSectionContainer(
      sectionFocusNode: _languageSectionNode,
      padding: const EdgeInsets.all(8.0),
      onActivate: () {
        if (_languageNodes.isNotEmpty) {
          _languageNodes.first.requestFocus();
        }
      },
      onFocusChange: (hasFocus) {
        if (hasFocus) {
          _announceSectionFocus(
            sectionId: _sectionLanguageId,
            sectionEvent: const InitScreenSectionLanguage(),
          );
        }
      },
      child: Row(
        children: [
          ...List.generate(state.languageList.length, (index) {
            final language = state.languageList[index];
            final focusNode = _languageNodes[index];
            return FocusableActionButton(
              focusNode: focusNode,
              onPressed: () => _cubit.changeLanguage(language),
              onFocusChange: (hasFocus) {
                _announceFocus(
                  hasFocus: hasFocus,
                  sectionId: _sectionLanguageId,
                  sectionEvent: const InitScreenSectionLanguage(),
                  widgetEvent: InitScreenWidgetLanguage(language),
                );
              },
              child: ElevatedButton(
                onPressed: () => _cubit.changeLanguage(language),
                child: Text(language),
              ),
            );
          }),
        ],
      ),
    );
  }

  void _registerStaticNodes() {
    _focusController.registerNode(_headerSectionFocusId, _headerSectionNode);
    _focusController.registerNode(_startOrderSectionFocusId, _startOrderSectionNode);
    _focusController.registerNode(_languageSectionFocusId, _languageSectionNode);

    _focusController.registerNode(_homeId, _homeNode);
    _focusController.registerNode(_callAgentId, _callAgentNode);
    _focusController.registerNode(_startOrderId, _startOrderNode);
    _updateNeighbors(0);
  }

  void _syncLanguageNodes(List<String> languages) {
    if (_languageNodes.length > languages.length) {
      for (int i = languages.length; i < _languageNodes.length; i++) {
        _focusController.unregisterNode(_languageId(i));
        _languageNodes[i].dispose();
      }
      _languageNodes.removeRange(languages.length, _languageNodes.length);
    }

    while (_languageNodes.length < languages.length) {
      _languageNodes.add(FocusNode(debugLabel: 'language-${_languageNodes.length}'));
    }

    for (int i = 0; i < _languageNodes.length; i++) {
      _focusController.registerNode(_languageId(i), _languageNodes[i]);
    }

    _updateNeighbors(_languageNodes.length);
  }

  void _updateNeighbors(int languageCount) {
    _focusController.updateNeighbors(
      _homeId,
      const FocusNeighbors(
        right: _callAgentId,
        down: _startOrderId,
        up: _headerSectionFocusId,
      ),
    );
    _focusController.updateNeighbors(
      _callAgentId,
      const FocusNeighbors(
        left: _homeId,
        down: _startOrderId,
        up: _headerSectionFocusId,
      ),
    );

    _focusController.updateNeighbors(
      _startOrderId,
      FocusNeighbors(
        up: _startOrderSectionFocusId,
        down: languageCount > 0 ? _languageId(0) : null,
      ),
    );

    _focusController.updateNeighbors(
      _headerSectionFocusId,
      const FocusNeighbors(
        down: _startOrderSectionFocusId,
      ),
    );

    _focusController.updateNeighbors(
      _startOrderSectionFocusId,
      FocusNeighbors(
        up: _headerSectionFocusId,
        down: languageCount > 0 ? _languageSectionFocusId : null,
      ),
    );

    _focusController.updateNeighbors(
      _languageSectionFocusId,
      FocusNeighbors(
        up: _startOrderSectionFocusId,
        down: null,
      ),
    );

    for (int i = 0; i < languageCount; i++) {
      _focusController.updateNeighbors(
        _languageId(i),
        FocusNeighbors(
          left: i > 0 ? _languageId(i - 1) : null,
          right: i < languageCount - 1 ? _languageId(i + 1) : null,
          up: _languageSectionFocusId,
        ),
      );
    }
  }

  void _announceFocus({
    required bool hasFocus,
    required String sectionId,
    required InitScreenTtsScenarioEvent sectionEvent,
    required InitScreenTtsScenarioEvent widgetEvent,
  }) {
    if (!hasFocus) return;
    if (_currentSectionId != sectionId) {
      _currentSectionId = sectionId;
      _cubit.announce(sectionEvent);
    }
    _cubit.announce(widgetEvent);
  }

  void _announceSectionFocus({
    required String sectionId,
    required InitScreenTtsScenarioEvent sectionEvent,
  }) {
    if (_currentSectionId != sectionId) {
      _currentSectionId = sectionId;
      _cubit.announce(sectionEvent);
    }
  }

  void _handleEscape() {
    final current = FocusManager.instance.primaryFocus;
    if (current == null) return;

    if (_languageNodes.contains(current)) {
      _languageSectionNode.requestFocus();
      return;
    }

    if (current == _startOrderNode) {
      _startOrderSectionNode.requestFocus();
      return;
    }

    if (current == _homeNode || current == _callAgentNode) {
      _headerSectionNode.requestFocus();
      return;
    }

    if (current == _languageSectionNode) {
      _startOrderSectionNode.requestFocus();
      return;
    }

    if (current == _startOrderSectionNode) {
      _headerSectionNode.requestFocus();
      return;
    }

    if (current == _headerSectionNode) {
      _homeNode.requestFocus();
      return;
    }
  }

  String _languageId(int index) => 'language-$index';
}
