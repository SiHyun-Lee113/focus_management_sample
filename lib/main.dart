import 'package:flutter/material.dart';
import 'package:barrier_free_test/presentation/app/my_app.dart';
import 'package:win32audio/win32audio.dart';

import 'data/tts/flutter_tts_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Audio.setupChangeListener();

  runApp(MyApp());
}