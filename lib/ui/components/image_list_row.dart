import 'package:flutter/material.dart';
import 'package:squarefit/models/media.dart';
import 'package:squarefit/ui/screens/editor_screen.dart';

class ImageListRow extends StatelessWidget {
  const ImageListRow({
    super.key,
    required this.widget,
    required this.onImageTap, // Callback for image tap
  });

  final EditorScreen widget;
  final Function(Media) onImageTap; // Function to handle image tap

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        // bg container
        Container(
          height: 112,
          width: MediaQuery.of(context).size.width,
          color: Colors.grey.shade200,
        ),

        // imported image List
        SizedBox(
          height: 96,
          child: ListView.builder(
            itemCount: widget.selectedMedias.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: GestureDetector(
                    onTap: () {
                      onImageTap(
                        // Handle image tap
                        widget.selectedMedias[index],
                      );
                    },
                    // Display the media widget
                    child: widget.selectedMedias[index].widget,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
