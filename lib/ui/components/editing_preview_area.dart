import 'package:flutter/material.dart';
import 'package:squarefit/models/media.dart';

class EditingPreviewArea extends StatelessWidget {
  const EditingPreviewArea({
    super.key,
    required this.selectedMedia, // Accept the selected media
  });

  final Media selectedMedia; // Media is non-null since it's always initialized

  @override
  Widget build(BuildContext context) {
    // Get the original width and height of the image
    final double width = selectedMedia.assetEntity.width.toDouble();
    final double height = selectedMedia.assetEntity.height.toDouble();

    return Container(
      // Set a fixed width (screen width) and bounded height
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width, // Make height equal to width
      color: Colors.grey, // Optional background color
      child: Center(
        child: AspectRatio(
          aspectRatio: width / height, // Maintain the original aspect ratio
          child: selectedMedia.widget, // Display the image
        ),
      ),
    );
  }
}
