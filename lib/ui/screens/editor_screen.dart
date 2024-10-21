import 'package:flutter/material.dart';
import 'package:squarefit/models/media.dart';

class EditorScreen extends StatelessWidget {
  final List<Media> selectedMedias;

  const EditorScreen({super.key, required this.selectedMedias});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Editor Screen"),
      ),
      body: ListView.builder(
        itemCount: selectedMedias.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: selectedMedias[index].widget, // Display the media widget
          );
        },
      ),
    );
  }
}
