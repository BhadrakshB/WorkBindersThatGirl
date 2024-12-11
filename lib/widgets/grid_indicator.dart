import 'package:flutter/material.dart';
import 'dart:math';

class GridIndicatorWidget extends StatelessWidget {
  final List<IndicatorData> indicators;

  const GridIndicatorWidget({Key? key, required this.indicators}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: indicators.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Two items per row
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) {
        final indicator = indicators[index];
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Circular Indicator
            CustomCircularIndicator(
              value: indicator.value,
              icon: indicator.icon,
            ),
            const SizedBox(height: 8),

            // Title
            Text(
              indicator.title,
              style: TextStyle(
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
  final IconData icon;

  const CustomCircularIndicator({
    Key? key,
    required this.value,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      height: 80,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Grey background circle
          CircularProgressIndicator(
            value: 1.0,
            strokeWidth: 8,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.grey[300]!),
          ),
          // Pink progress circle
          CircularProgressIndicator(
            value: value / 100,
            strokeWidth: 8,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.pink),
          ),
          // Icon in the center
          Icon(
            icon,
            size: 28,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}

class IndicatorData {
  final double value;
  final String title;
  final String subtitle;
  final IconData icon;

  IndicatorData({
    required this.value,
    required this.title,
    required this.subtitle,
    required this.icon,
  });
}
