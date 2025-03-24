// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:note_app_ver2/components/note_setting.dart';
import 'package:popover/popover.dart';

class NoteTile extends StatelessWidget {
  final String text;
  final Function()? deleteNote;
  final Function()? updateNote;
  const NoteTile({
    super.key,
    required this.text,
    required this.deleteNote,
    required this.updateNote,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        title: Text(text),
        trailing: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () {
                //show pop up menu
                showPopover(
                  context: context,
                  bodyBuilder:
                      (context) => NoteSettings(
                        onTapDelete: deleteNote,
                        onTapUpdate: updateNote,
                      ),
                  width: 100,
                  height: 100,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                );
              },
              icon: const Icon(Icons.more_vert),
              // trailing: Row(
              //   mainAxisSize: MainAxisSize.min,
              //   children: [
              // IconButton(icon: const Icon(Icons.delete), onPressed: deleteNote),
              // IconButton(icon: const Icon(Icons.edit), onPressed: updateNote),
              // ],
              // ),
            );
          },
        ),
      ),
    );
  }
}
