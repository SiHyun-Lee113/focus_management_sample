import 'dart:io' show Platform;

import 'package:barrier_free_test/data/tts/flutter_tts_service.dart';
import 'package:barrier_free_test/presentation/screen/init/init_screen.dart';
import 'package:barrier_free_test/presentation/screen/tts/tts_screen_cubit.dart';
import 'package:barrier_free_test/presentation/screen/tts/tts_screen_state.dart';
import 'package:barrier_free_test/presentation/widgets/setting_slider.dart';
import 'package:barrier_free_test/presentation/widgets/slider_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TtsScreen extends StatefulWidget {
  const TtsScreen({super.key});

  @override
  State<TtsScreen> createState() => _TtsScreenState();
}

class _TtsScreenState extends State<TtsScreen> {
  final FocusNode _keyboardFocusNode = FocusNode();
  late final TtsScreenCubit _cubit;

  bool get isAndroid => !kIsWeb && Platform.isAndroid;

  bool get isIOS => !kIsWeb && Platform.isIOS;

  @override
  void initState() {
    super.initState();
    _cubit = TtsScreenCubit(const TtsScreenState(), ttsService: FlutterTtsService());
  }

  @override
  void dispose() {
    _cubit.close();
    _keyboardFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit,
      child: BlocBuilder<TtsScreenCubit, TtsScreenState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(title: const Text('Flutter TTS')),
            body: RawKeyboardListener(
              focusNode: _keyboardFocusNode,
              autofocus: true,
              onKey: (RawKeyEvent event) {
                if (kDebugMode) {
                  debugPrint('Key event: ${event.runtimeType} ${event.logicalKey}');
                }
              },
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    _inputSection(),
                    _btnSection(),
                    _engineSection(state),
                    _voiceSection(state),
                    _languageSection(state),
                    _buildSliders(state),
                    if (isAndroid) _getMaxSpeechInputLengthSection(state),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => InitScreen()),
                        );
                      },
                      child: const Text('to init'),
                    ),
                  ],
                ),
              ),
            ),
            floatingActionButton: (isAndroid || isIOS) && _hasText(state)
                ? FloatingActionButton(
                    mini: true,
                    onPressed: _cubit.saveToFile,
                    tooltip: 'Synthesize to File',
                    child: const Icon(Icons.save),
                  )
                : null,
          );
        },
      ),
    );
  }

  bool _hasText(TtsScreenState state) => state.newVoiceText?.trim().isNotEmpty ?? false;

  Widget _engineSection(TtsScreenState state) {
    if (!isAndroid) return const SizedBox.shrink();
    if (state.enginesLoading) return const Text('Loading engines...');
    if (state.enginesError != null) return Text('Error: ${state.enginesError}');
    if (state.engines.isEmpty) return const Text('No data to load engines');

    return _enginesDropDownSection(state);
  }

  Widget _voiceSection(TtsScreenState state) {
    if (state.voicesLoading) return const Text('Loading voices...');
    if (state.voicesError != null) return Text('Error: ${state.voicesError}');
    if (state.voices.isEmpty) return const Text('No data to load voices');

    return _voicesDropDownSection(state);
  }

  Widget _languageSection(TtsScreenState state) {
    if (state.languagesLoading) return const Text('Loading Languages...');
    if (state.languagesError != null) return Text('Error: ${state.languagesError}');
    if (state.languages.isEmpty) return const Text('No data to load languages');

    return _languageDropDownSection(state);
  }

  Widget _inputSection() => Container(
    alignment: Alignment.topCenter,
    padding: const EdgeInsets.only(top: 25.0, left: 25.0, right: 25.0),
    child: TextField(maxLines: 11, minLines: 6, onChanged: _cubit.onTextChanged),
  );

  Widget _btnSection() {
    return Container(
      padding: const EdgeInsets.only(top: 50.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(
            Colors.green,
            Colors.greenAccent,
            Icons.play_arrow,
            'PLAY',
            _cubit.speak,
          ),
          _buildButtonColumn(Colors.red, Colors.redAccent, Icons.stop, 'STOP', _cubit.stop),
          _buildButtonColumn(Colors.blue, Colors.blueAccent, Icons.pause, 'PAUSE', _cubit.pause),
        ],
      ),
    );
  }

  Widget _enginesDropDownSection(TtsScreenState state) {
    return Container(
      padding: const EdgeInsets.only(top: 50.0),
      child: DropdownButton<String?>(
        value: state.engine,
        hint: const Text('Choose an engine'),
        items: _buildEngineItems(state.engines),
        onChanged: _cubit.changeEngine,
      ),
    );
  }

  Widget _voicesDropDownSection(TtsScreenState state) {
    return Container(
      padding: const EdgeInsets.only(top: 10.0),
      child: DropdownButton<Map<String, String>?>(
        value: state.voice,
        hint: const Text('Choose a voice'),
        items: _buildVoiceItems(state.voices),
        onChanged: _cubit.changeVoice,
      ),
    );
  }

  Widget _languageDropDownSection(TtsScreenState state) {
    return Container(
      padding: const EdgeInsets.only(top: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DropdownButton<String?>(
            value: state.language,
            hint: const Text('Choose a language'),
            items: _buildLanguageItems(state.languages),
            onChanged: _cubit.changeLanguage,
          ),
          const SizedBox(width: 5.0),
          Visibility(
            visible: isAndroid,
            child: Text("Is installed: ${state.isCurrentLanguageInstalled}"),
          ),
        ],
      ),
    );
  }

  Column _buildButtonColumn(
    Color color,
    Color splashColor,
    IconData icon,
    String label,
    VoidCallback onPressed,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(icon: Icon(icon), color: color, splashColor: splashColor, onPressed: onPressed),
        Container(
          margin: const EdgeInsets.only(top: 8.0),
          child: Text(
            label,
            style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400, color: color),
          ),
        ),
      ],
    );
  }

  Widget _getMaxSpeechInputLengthSection(TtsScreenState state) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: _cubit.loadMaxSpeechInputLength,
          child: const Text('Get max speech input length'),
        ),
        Text("${state.inputLength} characters"),
      ],
    );
  }

  int initValue = 1;
  Widget _buildSliders(TtsScreenState state) {
    return Column(
      children: [
        _volume(state),
        _pitch(state),
        _rate(state),
        StepSlider<int>(stepValues: [1, 2, 3, 4, 5], onStepChanged: (value) {
          setState(() {
            initValue = value;
          });

          print('_TtsScreenState._buildSliders $initValue');
        }, value: initValue),
      ],
    );
  }

  Widget _volume(TtsScreenState state) {
    return Slider(
      value: state.volume,
      onChanged: _cubit.changeVolume,
      min: 0.0,
      max: 1.0,
      divisions: 10,
      label: "Volume: ${state.volume}",
    );
  }

  Widget _pitch(TtsScreenState state) {
    return Slider(
      value: state.pitch,
      onChanged: _cubit.changePitch,
      min: 0.5,
      max: 2.0,
      divisions: 15,
      label: "Pitch: ${state.pitch}",
      activeColor: Colors.red,
    );
  }

  Widget _rate(TtsScreenState state) {
    return Slider(
      value: state.rate,
      onChanged: _cubit.changeRate,
      min: 0.0,
      max: 1.0,
      divisions: 10,
      label: "Rate: ${state.rate}",
      activeColor: Colors.green,
    );
  }

  List<DropdownMenuItem<String?>> _buildEngineItems(List<String?> engines) {
    final items = engines
        .map((item) => DropdownMenuItem<String?>(value: item, child: Text(item ?? '')))
        .toList();
    return items;
  }

  List<DropdownMenuItem<Map<String, String>?>> _buildVoiceItems(List<Map<String, String>> voices) {
    final items = <DropdownMenuItem<Map<String, String>?>>[];
    for (final voice in voices) {
      final menuItem = DropdownMenuItem<Map<String, String>?>(
        value: voice,
        child: Text("${voice['name']} (${voice['locale']})"),
      );
      if (!items.any((element) => mapEquals(element.value, menuItem.value))) {
        items.add(menuItem);
      }
    }
    items.sort(
      (a, b) => a.child.toString().toLowerCase().compareTo(b.child.toString().toLowerCase()),
    );
    return items;
  }

  List<DropdownMenuItem<String?>> _buildLanguageItems(List<String?> languages) {
    final items = <DropdownMenuItem<String?>>[];
    for (final language in languages) {
      final menuItem = DropdownMenuItem<String?>(value: language, child: Text(language ?? ''));
      if (!items.any((element) => element.value == menuItem.value)) {
        items.add(menuItem);
      }
    }
    items.sort(
      (a, b) => a.child.toString().toLowerCase().compareTo(b.child.toString().toLowerCase()),
    );
    return items;
  }
}
