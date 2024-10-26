import 'package:flutter/material.dart';

class EditingTools extends StatelessWidget {
  const EditingTools({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 32,
      // Buttons
      children: [
        // blur
        ToolButton(
          onTap: () {},
          icon: Icons.water_drop_rounded,
          text: 'Blur',
        ),
        // padding
        ToolButton(
          onTap: () {},
          icon: Icons.square,
          text: 'Padding',
        ),
        // color
        ToolButton(
          onTap: () {},
          icon: Icons.color_lens,
          text: 'Color',
        ),
        // design
        ToolButton(
          onTap: () {},
          icon: Icons.grid_4x4,
          text: 'Design',
        ),
        // filter
        ToolButton(
          onTap: () {},
          icon: Icons.photo_filter,
          text: 'Filter',
        ),
      ],
    );
  }
}

class ToolButton extends StatelessWidget {
  final Function()? onTap;
  final IconData? icon;
  final String text;

  const ToolButton({
    required this.onTap,
    required this.icon,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
            ),
            padding: EdgeInsets.all(8.0),
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 4),
          Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
