import 'package:flutter/material.dart';

class EditorAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onSave;

  const EditorAppBar({
    super.key,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.close),
      ),
      title: const Text('Square Fit'),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: onSave, // Trigger save action
          icon: const Icon(Icons.save_alt),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
