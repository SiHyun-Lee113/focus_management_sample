import 'package:barrier_free_test/data/focus_management/focus_id_repository.dart';
import 'package:barrier_free_test/presentation/screen/tts/tts_screen.dart';
import 'package:barrier_free_test/presentation/widgets/focus_management/focus_widget_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FocusWidgetCubit(
      ),
      child: MaterialApp(
        home: TtsScreen(),
      ),
    );
  }
}
