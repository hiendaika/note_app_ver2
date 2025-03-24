import 'package:flutter/material.dart';
import 'package:note_app_ver2/components/drawer_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          //Header
          Padding(
            padding: EdgeInsets.only(top: 100),
            child: Icon(
              Icons.note,
              size: 100,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Divider(color: Theme.of(context).colorScheme.inversePrimary),
          ),

          // notes tile
          DrawerTile(
            title: 'All notes',
            leading: Icon(Icons.home),
            onTap: () {
              Navigator.pop(context);
              //Navigate to all notes page
              Navigator.pushNamed(context, '/notes_page');
            },
          ),

          // settings tile
          DrawerTile(
            title: 'Settings',
            leading: Icon(Icons.settings),
            onTap: () {
              Navigator.pop(context);
              //Navigate to settings page
              Navigator.pushNamed(context, '/settings_page');
            },
          ),
        ],
      ),
    );
  }
}
