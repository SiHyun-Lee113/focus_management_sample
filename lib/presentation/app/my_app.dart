import 'package:barrier_free_test/data/tts/flutter_tts_service.dart';
import 'package:barrier_free_test/domain/tts/tts_service.dart';
import 'package:barrier_free_test/presentation/screen/tts/tts_screen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  final TtsService ttsService;

  MyApp({super.key, TtsService? ttsService})
      : ttsService = ttsService ?? FlutterTtsService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TtsScreen(ttsService: ttsService),
    );
  }
}
