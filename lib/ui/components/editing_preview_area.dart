import 'package:flutter/material.dart';

class EditingPreviewArea extends StatelessWidget {
  const EditingPreviewArea({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // Get the width of the screen and use it to set both height and width
      width: MediaQuery.of(context).size.width,
      // Ensures the height is the same as the width
      height: MediaQuery.of(context).size.width,
      child: Container(
        color: Colors.grey,
      ),
    );
  }
}
