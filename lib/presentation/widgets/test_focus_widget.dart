import 'package:flutter/material.dart';

class TestFocusWidget extends StatelessWidget {
  final bool hasFocus;
  final Widget child;

  const TestFocusWidget({
    super.key,
    required this.hasFocus,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
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
