import 'package:flutter/material.dart';
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
  void setState(VoidCallback fn) {
    super.setState(fn);
    //When app start read notes
    readNotes();
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
    context.watch<NoteDatabase>().fetchNotes();
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
        centerTitle: true,
      ),
      body:
          currentNotes.isEmpty
              ? Center(
                child: const Text('No notes', style: TextStyle(fontSize: 20)),
              )
              : Column(
                children: [
                  //Header
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: const Text('Notes'),
                  ),
                  //List note
                  Expanded(
                    child: ListView.builder(
                      itemCount: currentNotes.length,
                      itemBuilder: (context, index) {
                        final note = currentNotes[index];
                        return Card(
                          margin: EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 10,
                          ),
                          child: ListTile(
                            title: Text(note.title),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () {
                                    deleteNote(note);
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(Icons.edit),
                                  onPressed: () {
                                    updateNote(context, note);
                                  },
                                ),
                              ],
                            ),
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
        child: const Icon(Icons.add),
      ),
    );
  }
}
