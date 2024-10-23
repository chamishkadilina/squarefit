import 'package:flutter/material.dart';
import 'package:squarefit/ui/screens/picker_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PickerScreen(
        selectedMedias: [],
      ),
    );
  }
}
