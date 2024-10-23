import 'package:flutter/material.dart';

class EditingTools extends StatelessWidget {
  const EditingTools({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16,
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.water_drop_outlined,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.square_outlined,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.circle_outlined,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.dashboard_customize_outlined,
          ),
        ),
      ],
    );
  }
}
