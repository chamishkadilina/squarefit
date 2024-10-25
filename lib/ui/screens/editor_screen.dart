import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:squarefit/models/media.dart';
import 'package:squarefit/ui/components/editing_preview_area.dart';
import 'package:squarefit/ui/components/editing_tool_options.dart';
import 'package:squarefit/ui/components/editing_tools.dart';
import 'package:squarefit/ui/components/editor_app_bar.dart';
import 'package:squarefit/ui/components/image_list_row.dart';
import 'package:squarefit/ui/components/select_all_images.dart';
import 'dart:ui' as ui;

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

  Future<void> _saveImage() async {
    try {
      // Request permission to access photos
      final result = await PhotoManager.requestPermissionExtend();
      if (result.isAuth) {
        RenderRepaintBoundary boundary = _previewContainerKey.currentContext!
            .findRenderObject() as RenderRepaintBoundary;
        ui.Image image = await boundary.toImage(pixelRatio: 3.0);
        ByteData? byteData =
            await image.toByteData(format: ui.ImageByteFormat.png);
        if (byteData != null) {
          final Uint8List pngBytes = byteData.buffer.asUint8List();

          // Save image to gallery
          final asset = await PhotoManager.editor
              .saveImage(pngBytes, filename: 'myEditedImage');
          if (asset != null) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Image saved successfully!")));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Failed to save image")));
          }
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Storage permission not granted")));
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Failed to save image")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EditorAppBar(onSave: _saveImage),
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
