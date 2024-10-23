import 'package:flutter/material.dart';

class EditingToolOptions extends StatelessWidget {
  const EditingToolOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 96, // Fixed height for the row
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            // Use Expanded here to make the children flexible
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                color: Colors.grey,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                color: Colors.grey,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                color: Colors.grey,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
