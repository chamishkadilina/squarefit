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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EditorAppBar(),
      body: Column(
        children: [
          // square image(editing pre-view)
          EditingPreviewArea(),
          // Tools options
          EditingToolOptions(),
          // tools
          EditingTools(),
          // select all image text
          SelectAllImages(selectAll: selectAll),
          // image listView
          ImageListRow(widget: widget),
        ],
      ),
    );
  }
}
