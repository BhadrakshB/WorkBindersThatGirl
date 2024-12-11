import 'package:flutter/material.dart';

class ExpandableSection extends StatelessWidget {
  final String title;
  final String content;

  const ExpandableSection({
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(content, style: TextStyle(fontSize: 14, height: 1.5)),
        ),
      ],
    );
  }
}
