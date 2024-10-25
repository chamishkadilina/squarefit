import 'dart:ui';
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
    // Get the original width of the screen (to create a square container)
    final double screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      width: screenWidth, // Set width to screen width
      height: screenWidth, // Set height equal to width to make it a square
      child: Stack(
        children: [
          // Background image with blur
          ClipRRect(
            child: Stack(
              children: [
                // Original background image
                Positioned.fill(
                  child: FittedBox(
                    fit: BoxFit
                        .cover, // Fill the square while maintaining aspect ratio
                    child:
                        selectedMedia.widget, // Display the image as background
                  ),
                ),
                // Apply the blur effect
                Positioned.fill(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                        sigmaX: 5.0, sigmaY: 5.0), // Adjust blur intensity
                    child: Container(
                      color: Colors.black.withOpacity(0), // Transparent overlay
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Overlaying image maintaining aspect ratio
          Center(
            child: SizedBox(
              width: screenWidth, // Square width
              height: screenWidth, // Square height
              child: FittedBox(
                fit: BoxFit.contain, // Contain image within the square
                child: selectedMedia.widget, // Display the original image
              ),
            ),
          ),
        ],
      ),
    );
  }
}
