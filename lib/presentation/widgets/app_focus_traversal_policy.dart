import 'package:flutter/widgets.dart';
import 'package:barrier_free_test/presentation/widgets/focus_navigation_controller.dart';

class AppFocusTraversalPolicy extends WidgetOrderTraversalPolicy {
  final FocusNavigationController controller;

  AppFocusTraversalPolicy({required this.controller});

  @override
  bool inDirection(FocusNode currentNode, TraversalDirection direction) {
    final neighbor = controller.neighborOf(currentNode, direction);
    if (neighbor != null) {
      neighbor.requestFocus();
      return true;
    }

    return super.inDirection(currentNode, direction);
  }
}
