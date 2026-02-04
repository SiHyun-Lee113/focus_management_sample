import 'package:barrier_free_test/data/tts/flutter_tts_service.dart';
import 'package:barrier_free_test/domain/focus/init/init_screen_focus_meta_data_handler.dart';
import 'package:barrier_free_test/presentation/screen/init/init_screen_cubit.dart';
import 'package:barrier_free_test/presentation/screen/init/init_screen_cubit_keyboard_handler_extension.dart';
import 'package:barrier_free_test/presentation/screen/init/init_screen_cubit_tts_service_extension.dart';
import 'package:barrier_free_test/presentation/screen/init/init_screen_state.dart';
import 'package:barrier_free_test/presentation/screen/init/model/init_focus_meta_data.dart';
import 'package:barrier_free_test/presentation/widgets/test_focus_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InitScreen extends StatefulWidget {
  const InitScreen({super.key});

  @override
  State<InitScreen> createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  final FocusNode _keyboardFocusNode = FocusNode();
  final _cubit = InitScreenCubit(
    InitScreenState(),
    focusMetaDataHandler: InitScreenFocusMetaDataHandler(),
    ttsService: FlutterTtsService(),
  );

  @override
  void dispose() {
    _keyboardFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider.value(
        value: _cubit,
        child: BlocConsumer<InitScreenCubit, InitScreenState>(
          builder: (context, state) {
            return RawKeyboardListener(
              focusNode: _keyboardFocusNode,
              autofocus: true,
              onKey: (RawKeyEvent event) {
                if (event is RawKeyDownEvent && !event.repeat) {
                  _cubit.handelKeyEvent(event.logicalKey);
                }
              },
              child: Column(
                children: [
                  _sectionHeader(state),
                  _sectionStartOrder(state),
                  _sectionLanguage(state),
                ],
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
    return TestFocusWidget(
      focusId: InitFocusMetaData.initHeaderSectionFocusId,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TestFocusWidget(
            focusId: InitFocusMetaData.initHomeButtonFocusId,
            child: ElevatedButton(onPressed: _cubit.navigateHome, child: Text('처음으로')),
          ),
          TestFocusWidget(
            focusId: InitFocusMetaData.initCallAgentButtonFocusId,
            child: ElevatedButton(onPressed: _cubit.callAgent, child: Text('직원호출')),
          ),
        ],
      ),
    );
  }

  Widget _sectionStartOrder(InitScreenState state) {
    return TestFocusWidget(
      focusId: InitFocusMetaData.initStartOrderSectionFocusId,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TestFocusWidget(
            focusId: InitFocusMetaData.initStartOrderButtonFocusId,
            child: ElevatedButton(onPressed: _cubit.navigateStartOrder, child: Text('주문하기')),
          ),
        ],
      ),
    );
  }

  Widget _sectionLanguage(InitScreenState state) {
    return TestFocusWidget(
      focusId: InitFocusMetaData.initLanguageSectionFocusId,
      child: Row(
        children: [
          ...List.generate(state.languageList.length, (index) {
            return TestFocusWidget(
                focusId: 'languageId${state.languageList[index]}',
                child: ElevatedButton(onPressed: () {
                  _cubit.changeLanguage(state.languageList[index]);
                }, child: Text(state.languageList[index])),
            );
          }),
        ],
      ),
    );
  }
}
