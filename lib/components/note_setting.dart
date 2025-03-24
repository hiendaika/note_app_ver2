import 'package:flutter/material.dart';

class NoteSettings extends StatelessWidget {
  final void Function()? onTapDelete;
  final void Function()? onTapUpdate;

  const NoteSettings({
    super.key,
    required this.onTapDelete,
    required this.onTapUpdate,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);

            onTapDelete!();
          },
          child: Container(
            height: 50,
            color: Theme.of(context).colorScheme.surface,
            child: Center(
              child: Text(
                'Delete',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
            ),
          ),
        ),

        GestureDetector(
          onTap: () {
            Navigator.pop(context);
            onTapUpdate!();
          },
          child: Container(
            height: 50,
            color: Theme.of(context).colorScheme.surface,
            child: Center(
              child: Text(
                'Update',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
