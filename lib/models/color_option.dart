import 'package:flutter/material.dart';

class ColorOption {
  final String colorName;
  final String colorCode;

  ColorOption({required this.colorName, required this.colorCode});

  factory ColorOption.fromJson(Map<String, dynamic> json) {
    return ColorOption(
      colorName: json['colorName'],
      colorCode: json['colorCode'],
    );
  }

  Color getColor() {
    return Color(int.parse(colorCode.substring(1, 7), radix: 16) + 0xFF000000);
  }
}
