import 'package:flutter/material.dart';
import 'package:searchfield/searchfield.dart';

class LocationFinder extends StatelessWidget {
  const LocationFinder({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
        child: SearchField(
          suggestions: const [],
        ),
      ),
    );
  }
}
