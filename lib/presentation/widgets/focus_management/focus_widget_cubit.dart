import 'dart:async';

import 'package:barrier_free_test/data/focus_management/focus_id_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FocusWidgetCubit extends Cubit<String?> {
  final FocusIdRepository _focusIdRepository = FocusIdRepository.instance;
  late final StreamSubscription _sub;

  FocusWidgetCubit() : super('') {
    _sub = _focusIdRepository.stream.listen(emit);
  }

  @override
  Future<void> close() async {
    await _sub.cancel();
    return super.close();
  }
}