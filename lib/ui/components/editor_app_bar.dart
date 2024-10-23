import 'package:flutter/material.dart';

class EditorAppBar extends StatelessWidget implements PreferredSizeWidget {
  const EditorAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // leading icon
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.close),
      ),
      // title
      title: const Text('Square Fit'),
      centerTitle: true,
      // trailing icon
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.save_alt),
        ),
      ],
    );
  }

  // You need to override the preferredSize property as required by PreferredSizeWidget
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
