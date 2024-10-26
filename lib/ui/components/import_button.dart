import 'package:flutter/material.dart';
import 'package:squarefit/models/media.dart';
import 'package:squarefit/ui/components/show_custom_snackbar.dart';
import 'package:squarefit/ui/screens/editor_screen.dart';

class ImportButton extends StatelessWidget {
  const ImportButton({
    super.key,
    required List<Media> selectedMedias,
  }) : _selectedMedias = selectedMedias;

  final List<Media> _selectedMedias;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Only navigate if at least one media is selected
        if (_selectedMedias.isNotEmpty) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  EditorScreen(selectedMedias: _selectedMedias),
            ),
          );
        } else {
          // show no media is selected snakebar message
          showCustomSnackBar(
            context,
            'Please select at least one image to proceed.',
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.greenAccent.shade700,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 4,
            ),
            child: Text(
              'Import (${_selectedMedias.length.toString()})',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}
