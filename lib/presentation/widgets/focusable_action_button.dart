import 'package:flutter/material.dart';

class FocusableActionButton extends StatelessWidget {
  final FocusNode focusNode;
  final VoidCallback onPressed;
  final ValueChanged<bool>? onFocusChange;
  final Widget child;

  const FocusableActionButton({
    super.key,
    required this.focusNode,
    required this.onPressed,
    required this.child,
    this.onFocusChange,
  });

  @override
  Widget build(BuildContext context) {
    return FocusableActionDetector(
      focusNode: focusNode,
      onFocusChange: onFocusChange,
      actions: <Type, Action<Intent>>{
        ActivateIntent: CallbackAction<ActivateIntent>(
          onInvoke: (_) {
            onPressed();
            return null;
          },
        ),
      },
      child: AnimatedBuilder(
        animation: focusNode,
        builder: (context, child) {
          final hasFocus = focusNode.hasFocus;
          return Container(
            decoration: hasFocus
                ? BoxDecoration(
                    border: Border.all(color: Colors.red),
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.grey[200],
                  )
                : null,
            child: child,
          );
        },
        child: child,
      ),
    );
  }
}
