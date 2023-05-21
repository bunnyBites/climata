import 'package:flutter/material.dart';

class WidgetContainer extends StatelessWidget {
  const WidgetContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      height: 70.0,
    );
  }
}
