import 'package:barrier_free_test/presentation/widgets/focus_management/focus_widget_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TestFocusWidget extends StatelessWidget {
  final String focusId;
  final Widget child;

  const TestFocusWidget({
    super.key,
    required this.focusId,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {

    /// 1. 현재 활성화 되어 있는 focusHandler 혹은 screen 정보 습득
    /// 그 핸들러에서 currentFocusMetaData 추룰
    /// bool hasFocus = currentFocusMetaData?.focusId == focusId
    final currentFocusId = context.watch<FocusWidgetCubit>().state;
    final hasFocus = currentFocusId == focusId;


    if (hasFocus) {
      return Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.red),
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.grey[200],
        ),
        child: child,
      );
    }

    return child;
  }
}
