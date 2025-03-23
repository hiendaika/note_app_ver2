import 'package:flutter/material.dart';
import 'package:note_app_ver2/models/note_database.dart';
import 'package:note_app_ver2/pages/note_page.dart';
import 'package:note_app_ver2/theme/theme_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  //initialize the database
  WidgetsFlutterBinding.ensureInitialized();
  await NoteDatabase.initialize();
  runApp(
    MultiProvider(
      providers: [
        // Note provider
        ChangeNotifierProvider(create: (context) => NoteDatabase()),

        // Theme provider
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NotePage(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
