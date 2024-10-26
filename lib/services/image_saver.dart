import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:squarefit/ui/components/show_custom_snackbar.dart';

Future<void> saveImage({
  required GlobalKey previewContainerKey,
  required BuildContext context,
  String filename = 'myEditedImage',
  double pixelRatio = 3.0,
  String successMessage = "Image saved successfully!",
  String failureMessage = "Failed to save image",
  String permissionMessage = "Storage permission not granted",
}) async {
  // Ensure the widget is still in the widget tree
  if (!context.mounted) return;

  try {
    // Request permission to access photos
    final permissionResult = await PhotoManager.requestPermissionExtend();
    if (!permissionResult.isAuth) {
      if (context.mounted) showCustomSnackBar(context, permissionMessage);
      return;
    }

    RenderRepaintBoundary boundary = previewContainerKey.currentContext!
        .findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage(pixelRatio: pixelRatio);
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);

    if (byteData != null) {
      final Uint8List pngBytes = byteData.buffer.asUint8List();

      // Save image to gallery
      await PhotoManager.editor.saveImage(pngBytes, filename: filename);
      if (context.mounted) {
        showCustomSnackBar(
          context,
          backgroundColor: Colors.green,
          successMessage,
        );
      }
    } else if (context.mounted) {
      showCustomSnackBar(context, 'Image processing failed');
    }
  } catch (e) {
    if (context.mounted) {
      showCustomSnackBar(context, 'An error occurred: $e');
    }
  }
}
