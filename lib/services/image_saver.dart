import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:photo_manager/photo_manager.dart';

Future<void> saveImage({
  required GlobalKey previewContainerKey,
  required BuildContext context,
  String filename = 'myEditedImage',
  double pixelRatio = 3.0,
  String successMessage = "Image saved successfully!",
  String failureMessage = "Failed to save image",
  String permissionMessage = "Storage permission not granted",
}) async {
  try {
    // Request permission to access photos
    final permissionResult = await PhotoManager.requestPermissionExtend();
    if (!permissionResult.isAuth) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(permissionMessage)),
      );
      return;
    }

    RenderRepaintBoundary boundary = previewContainerKey.currentContext!
        .findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage(pixelRatio: pixelRatio);
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);

    if (byteData != null) {
      final Uint8List pngBytes = byteData.buffer.asUint8List();

      // Save image to gallery
      final asset =
          await PhotoManager.editor.saveImage(pngBytes, filename: filename);
      if (asset != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(successMessage)),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(failureMessage)),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Image processing failed")),
      );
    }
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("An error occurred: $e")),
    );
  }
}
