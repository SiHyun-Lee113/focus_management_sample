import 'package:flutter/material.dart';

class StepSlider<T> extends StatelessWidget {
  final List<T> stepValues;
  final Function(T) onStepChanged;
  final T value;

  const StepSlider({
    super.key,
    required this.stepValues,
    required this.onStepChanged,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final currentIndex = stepValues.indexOf(value).clamp(0, stepValues.length - 1);

    return LayoutBuilder(
      builder: (context, constraints) {
        final sliderWidth = constraints.maxWidth;
        final stepCount = stepValues.length;
        final hasSteps = stepCount > 1;
        const stepIndicatorWidth = 11.0;
        final stepSpacing = hasSteps ? (sliderWidth - stepIndicatorWidth) / (stepCount - 1) : 0.0;
        const currentIndicatorRadius = 10.0;

        double stepCenterX(int index) {
          if (!hasSteps) return 0.0;
          return (index * stepSpacing) + (stepIndicatorWidth / 2);
        }

        void updateByPosition(double localDx) {
          if (!hasSteps) return;
          final clampedDx = localDx.clamp(0.0, sliderWidth);
          final normalized = (clampedDx - (stepIndicatorWidth / 2)) / stepSpacing;
          final index = normalized.round().clamp(0, stepCount - 1);
          final nextValue = stepValues[index];
          if (nextValue == value) return;
          onStepChanged(nextValue);
        }

        return GestureDetector(
          onHorizontalDragStart: (details) => updateByPosition(details.localPosition.dx),
          onHorizontalDragUpdate: (details) => updateByPosition(details.localPosition.dx),
          onTapDown: (details) => updateByPosition(details.localPosition.dx),
          child: SizedBox(
            width: size.width,
            height: 60,
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                /// 위치 인디케이터
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ...List.generate(stepValues.length, (index) {
                      final stepValue = stepValues[index];

                      return GestureDetector(
                        onTap: () {
                          onStepChanged(stepValue);
                        },
                        child: Container(
                          width: 11,
                          height: 60,
                          color: Color(0xFF857F79),
                        ),
                      );
                    }),
                  ],
                ),

                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: size.width,
                    height: 28 * size.aspectRatio,
                    decoration: const BoxDecoration(
                      color: Color(0xFF857F79),
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: hasSteps ? stepCenterX(currentIndex) : 0,
                    height: 28 * size.aspectRatio,
                    decoration: const BoxDecoration(
                      color: Color(0xFFD28A3C),
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                  ),
                ),


                Positioned(
                  left: hasSteps ? stepCenterX(currentIndex) - currentIndicatorRadius : 0.0,
                  top: 0,
                  bottom: 0,
                  child: Center(
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 120),
                      width: currentIndicatorRadius * 2,
                      height: currentIndicatorRadius * 2,
                      decoration: BoxDecoration(
                        color: const Color(0xFFD28A3C),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
