import 'package:flutter/material.dart';
import 'package:squarefit/models/media.dart';
import 'package:squarefit/ui/components/editing_preview_area.dart';
import 'package:squarefit/ui/components/editing_tool_options.dart';
import 'package:squarefit/ui/components/editing_tools.dart';
import 'package:squarefit/ui/components/editor_app_bar.dart';
import 'package:squarefit/ui/components/image_list_row.dart';
import 'package:squarefit/ui/components/select_all_images.dart';

class EditorScreen extends StatefulWidget {
  final List<Media> selectedMedias;

  const EditorScreen({
    super.key,
    required this.selectedMedias,
  });

  @override
  State<EditorScreen> createState() => _EditorScreenState();
}

class _EditorScreenState extends State<EditorScreen> {
  bool selectAll = false;

  // Variable to hold the selected media, initialize it to the first media in the list
  late Media selectedMedia;

  @override
  void initState() {
    super.initState();
    // Initially show the first image in the preview area
    selectedMedia = widget.selectedMedias[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EditorAppBar(),
      body: Column(
        children: [
          // Editing preview area
          EditingPreviewArea(
            selectedMedia:
                selectedMedia, // Pass the selected media to preview area
          ),
          // Tools options
          EditingToolOptions(),
          // Editing tools
          EditingTools(),
          // Select all image text
          SelectAllImages(selectAll: selectAll),
          // Image list view
          ImageListRow(
            widget: widget,
            onImageTap: (Media media) {
              setState(() {
                selectedMedia = media; // Update the selected media when tapped
              });
            },
          ),
        ],
      ),
    );
  }
}
