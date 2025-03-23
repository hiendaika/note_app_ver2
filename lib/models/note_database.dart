import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:note_app_ver2/models/note.dart';
import 'package:path_provider/path_provider.dart';

class NoteDatabase extends ChangeNotifier {
  static late Isar isar;
  //Initialize database
  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open([NoteSchema], directory: dir.path);
  }

  //List all notes
  List<Note> currentNotes = [];

  // Create a note and save to database
  Future<void> addNote(String text) async {
    //Create a new note object
    final newNote = Note()..title = text;

    //Save to database
    await isar.writeTxn(() => isar.notes.put(newNote));

    //Refresh the list of notes
    fetchNotes();
  }

  // Read - notes from database
  Future<void> fetchNotes() async {
    final List<Note> notes = await isar.notes.where().findAll();
    currentNotes.clear();
    currentNotes.addAll(notes);
    notifyListeners();
  }

  // Update - a note in database
  Future<void> updateNote(int id, String newNote) async {
    final existingNote = await isar.notes.get(id);
    if (existingNote != null) {
      existingNote.title = newNote;
      await isar.writeTxn(() => isar.notes.put(existingNote));
      fetchNotes();
    }
  }

  // Delete - a note from database
  Future<void> deleteNote(int id) async {
    await isar.writeTxn(() => isar.notes.delete(id));
    await fetchNotes();
  }
}
