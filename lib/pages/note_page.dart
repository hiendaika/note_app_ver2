import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_app_ver2/components/drawer.dart';
import 'package:note_app_ver2/components/note_tile.dart';
import 'package:note_app_ver2/models/note.dart';
import 'package:note_app_ver2/models/note_database.dart';
import 'package:provider/provider.dart';

class NotePage extends StatefulWidget {
  const NotePage({super.key});

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  @override
  void initState() {
    //When app start read notes
    readNotes();
    super.initState();
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
    // readNotes();
  }

  final TextEditingController myController = TextEditingController();

  //create note
  void createNote(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text('Create Note'),
            content: TextField(controller: myController),
            actions: [
              MaterialButton(
                onPressed: () {
                  // Save to database
                  context.read<NoteDatabase>().addNote(myController.text);

                  //clear the text field
                  myController.clear();

                  //close the dialog
                  Navigator.pop(context);
                },
                child: Text('Save'),
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancel'),
              ),
            ],
          ),
    );
  }

  // read notes
  void readNotes() {
    context.read<NoteDatabase>().fetchNotes();
  }

  //update note
  void updateNote(BuildContext context, Note note) {
    myController.text = note.title;
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text('Update Note'),
            content: TextField(controller: myController..text = note.title),
            actions: [
              MaterialButton(
                onPressed: () {
                  // Save to database
                  context.read<NoteDatabase>().updateNote(
                    note.id,
                    myController.text,
                  );

                  // clear the text field
                  myController.clear();

                  //close the dialog
                  Navigator.pop(context);
                },
                child: Text('Save'),
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancel'),
              ),
            ],
          ),
    );
  }

  //delete note
  void deleteNote(Note note) {
    context.read<NoteDatabase>().deleteNote(note.id);
  }

  @override
  Widget build(BuildContext context) {
    //Note database
    NoteDatabase database = context.watch<NoteDatabase>();

    //Current notes
    List<Note> currentNotes = database.currentNotes;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
      ),
      drawer: MyDrawer(),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body:
          currentNotes.isEmpty
              ? Center(
                child: const Text('No notes', style: TextStyle(fontSize: 20)),
              )
              : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Header
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: Text(
                      'Notes',
                      style: GoogleFonts.dmSerifText(
                        fontSize: 48,
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ),
                  ),
                  //List note
                  Expanded(
                    child: ListView.builder(
                      itemCount: currentNotes.length,
                      itemBuilder: (context, index) {
                        final note = currentNotes[index];
                        return Card(
                          margin: EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 8,
                          ),
                          child: NoteTile(
                            text: note.title,
                            deleteNote: () {
                              deleteNote(note);
                            },
                            updateNote: () {
                              updateNote(context, note);
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          createNote(context);
        },
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
      ),
    );
  }
}
