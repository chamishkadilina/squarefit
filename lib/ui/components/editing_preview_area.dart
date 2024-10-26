import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:squarefit/models/media.dart';

class EditingPreviewArea extends StatelessWidget {
  final Media selectedMedia;
  final double blurIntensity; // New parameter for blur intensity

  const EditingPreviewArea({
    super.key,
    required this.selectedMedia,
    required this.blurIntensity, // Required parameter
  });

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
                        // Adjust blur intensity
                        sigmaX: blurIntensity,
                        sigmaY: blurIntensity),
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
              width: screenWidth,
              height: screenWidth,
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
