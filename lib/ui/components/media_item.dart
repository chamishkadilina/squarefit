import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:squarefit/models/media.dart';

// Widget to display a media item with optional selection overlay
class MediaItem extends StatelessWidget {
  final Media media;
  final bool isSelected;
  final Function selectMedia;

  const MediaItem({
    required this.media,
    required this.isSelected,
    required this.selectMedia,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // Callback function when the media is tapped
      onTap: () => selectMedia(media),
      child: Stack(
        children: [
          // Display the media widget with optional padding
          _buildMediaWidget(),
          Positioned.fill(
            child: Container(
              // Semi-transparent black overlay
              child: media.assetEntity.type == AssetType.video
                  ? const Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          // Checkmark icon
                          Icons.play_arrow_rounded,
                          // White color for the icon
                          color: Colors.white,
                        ),
                      ),
                    )
                  : null,
            ),
          ),
          // Display the selected overlay if the media is selected
          isSelected
              ? _buildOverlay(Icons.check_circle)
              : _buildOverlay(Icons.circle_outlined),
        ],
      ),
    );
  }

  // Build the media widget with optional padding
  Widget _buildMediaWidget() {
    return Positioned.fill(
      child: Padding(
        padding: EdgeInsets.all(isSelected ? 12.0 : 0.0),
        // Display the media widget
        child: ClipRRect(
          borderRadius: BorderRadius.circular(isSelected ? 12.0 : 0.0),
          child: media.widget,
        ),
      ),
    );
  }

  // Builds an overlay with an icon to indicate selected/unselected status
  Widget _buildOverlay(IconData icon) {
    return Positioned.fill(
      child: Container(
        // Semi-transparent black overlay
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.1),
        ),
        child: Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
