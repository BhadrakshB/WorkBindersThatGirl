import 'package:flutter/material.dart';
import 'dart:math';

class GridIndicatorWidget extends StatelessWidget {
  final List<IndicatorData> indicators;

  const GridIndicatorWidget({super.key, required this.indicators});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: indicators.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Two items per row
        mainAxisSpacing: 15,
        crossAxisSpacing: 0,
        childAspectRatio: 1.5,
      ),
      itemBuilder: (context, index) {
        final indicator = indicators[index];
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Circular Indicator
            CustomCircularIndicator(
              value: indicator.value,
              widget: indicator.widget,
            ),
            const SizedBox(height: 4),

            // Title
            Text(
              indicator.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 4),

            // Subtitle
            Text(
              indicator.subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
          ],
        );
      },
    );
  }
}

class CustomCircularIndicator extends StatelessWidget {
  final double value; // The progress value (e.g., 75 means 75%).
  final Widget widget;
  final double size;

  const CustomCircularIndicator({
    super.key,
    required this.value,
    required this.widget,
    this.size = 60,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Grey background circle
          SizedBox(
            height: size,
            width: size,
            child: CircularProgressIndicator(
              value: 1.0,
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.grey[300]!),
            ),
          ),
          // Pink progress circle
          SizedBox(
            height: size,
            width: size,
            child: CircularProgressIndicator(
              value: value,
              strokeWidth: 2,
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.pink),
            ),
          ),
          // Widget in the center
          widget
        ],
      ),
    );
  }
}

class IndicatorData {
  final double value;
  final String title;
  final String subtitle;
  final Widget widget;

  IndicatorData({
    required this.value,
    required this.title,
    required this.subtitle,
    required this.widget,
  });
}
