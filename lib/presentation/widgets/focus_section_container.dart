import 'package:flutter/material.dart';

class FocusSectionContainer extends StatelessWidget {
  final FocusNode sectionFocusNode;
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onActivate;
  final ValueChanged<bool>? onFocusChange;

  const FocusSectionContainer({
    super.key,
    required this.sectionFocusNode,
    required this.child,
    this.padding,
    this.onActivate,
    this.onFocusChange,
  });

  @override
  Widget build(BuildContext context) {
    return FocusableActionDetector(
      focusNode: sectionFocusNode,
      onFocusChange: onFocusChange,
      actions: <Type, Action<Intent>>{
        ActivateIntent: CallbackAction<ActivateIntent>(
          onInvoke: (_) {
            onActivate?.call();
            return null;
          },
        ),
      },
      child: AnimatedBuilder(
        animation: sectionFocusNode,
        builder: (context, child) {
          final hasFocus = sectionFocusNode.hasFocus;
          return Container(
            padding: padding,
            decoration: hasFocus
                ? BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.blue.withValues(alpha: 0.08),
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
