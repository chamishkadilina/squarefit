import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:squarefit/models/media.dart';

class EditingToolOptions extends StatelessWidget {
  final Media selectedMedia;
  final ValueChanged<double> onBlurSelected;

  const EditingToolOptions({
    required this.selectedMedia,
    required this.onBlurSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 96, // Fixed height for the row
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                onBlurSelected(5);
              },
              child: ToolOption(
                blurIntensity: 5,
                selectedMedia: selectedMedia,
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                onBlurSelected(10);
              },
              child: ToolOption(
                blurIntensity: 10,
                selectedMedia: selectedMedia,
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                onBlurSelected(20);
              },
              child: ToolOption(
                blurIntensity: 20,
                selectedMedia: selectedMedia,
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                onBlurSelected(40);
              },
              child: ToolOption(
                blurIntensity: 40,
                selectedMedia: selectedMedia,
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                onBlurSelected(80);
              },
              child: ToolOption(
                blurIntensity: 80,
                selectedMedia: selectedMedia,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ToolOption extends StatelessWidget {
  final double blurIntensity;

  const ToolOption({
    super.key,
    required this.blurIntensity,
    required this.selectedMedia,
  });

  final Media selectedMedia;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: AspectRatio(
        aspectRatio: 1, // Ensures a perfect square
        child: ClipRRect(
          child: Stack(
            children: [
              // Original background image
              Positioned.fill(
                child: FittedBox(
                  // Fill the square while maintaining aspect ratio
                  fit: BoxFit.cover,
                  // Display the image as background
                  child: selectedMedia.widget,
                ),
              ),
              // Apply the blur effect
              Positioned.fill(
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    // Adjust blur intensity
                    sigmaX: blurIntensity,
                    sigmaY: blurIntensity,
                  ),
                  child: Container(
                    // Transparent overlay
                    color: Colors.black.withOpacity(0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
