import 'package:flutter/material.dart';

void showCustomSnackBar(
  BuildContext context,
  String message, {
  Color backgroundColor = const Color(0xFF202124),
  Duration duration = const Duration(seconds: 2),
  TextStyle textStyle = const TextStyle(color: Colors.white),
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text(
        message,
        style: textStyle,
      ),
      backgroundColor: backgroundColor,
      duration: duration,
    ),
  );
}
