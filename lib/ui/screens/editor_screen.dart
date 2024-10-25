import 'package:flutter/material.dart';
import 'package:squarefit/models/media.dart';
import 'package:squarefit/services/image_saver.dart';
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
  late Media selectedMedia;
  final GlobalKey _previewContainerKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    selectedMedia = widget.selectedMedias[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EditorAppBar(
        onSave: () => saveImage(
          previewContainerKey: _previewContainerKey,
          context: context,
        ),
      ),
      body: Column(
        children: [
          RepaintBoundary(
            key: _previewContainerKey,
            child: EditingPreviewArea(selectedMedia: selectedMedia),
          ),
          EditingToolOptions(),
          EditingTools(),
          SelectAllImages(selectAll: selectAll),
          ImageListRow(
            widget: widget,
            onImageTap: (Media media) {
              setState(() {
                selectedMedia = media;
              });
            },
          ),
        ],
      ),
    );
  }
}
