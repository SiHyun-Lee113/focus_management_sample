import 'package:barrier_free_test/data/tts/flutter_tts_service.dart';
import 'package:barrier_free_test/domain/tts/tts_service.dart';
import 'package:barrier_free_test/presentation/screen/init/init_screen.dart';
import 'package:barrier_free_test/presentation/screen/tts/tts_screen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InitScreen(),
    );
  }
}
