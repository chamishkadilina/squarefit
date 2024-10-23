import 'package:flutter/material.dart';

class SelectAllImages extends StatefulWidget {
  const SelectAllImages({
    super.key,
    required this.selectAll,
  });

  final bool selectAll;

  @override
  State<SelectAllImages> createState() => _SelectAllImagesState();
}

class _SelectAllImagesState extends State<SelectAllImages> {
  late bool selectAll; // Declare a local state variable

  @override
  void initState() {
    super.initState();
    // Initialize the local state with the value from the widget
    selectAll = widget.selectAll;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectAll = !selectAll; // Toggle the checkbox state
          });
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Checkbox(
              value: selectAll,
              onChanged: (value) {
                setState(() {
                  selectAll = value ?? false;
                });
              },
            ),
            Text(
              'Select All',
              style: TextStyle(
                fontSize: 20,
                color: Colors.greenAccent.shade400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
