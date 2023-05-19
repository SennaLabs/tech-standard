import 'dart:math';

import 'package:flutter/material.dart';

class ExampleCard extends StatelessWidget {
  const ExampleCard({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  static const List<Color> colors = [
    Color(0xFF898AA6),
    Color(0xFFC9BBCF),
    Color(0xFFB7D3DF),
    Color(0xFFD6EFED),
    Color(0xFFF4BFBF),
    Color(0xFFFFD9C0),
    Color(0xFFFAF0D7),
    Color(0xFF8CC0DE),
  ];

  Color get _randomColor {
    Random random = Random();
    int randomIndex = random.nextInt(colors.length);

    return colors[randomIndex];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: _randomColor,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: child,
    );
  }
}
