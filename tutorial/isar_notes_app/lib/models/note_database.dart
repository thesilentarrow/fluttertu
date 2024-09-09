import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import 'package:isar_todo_app/models/note.dart';
import 'package:path_provider/path_provider.dart';

class NoteDatabase extends ChangeNotifier{
  static late Isar isar;
  
  // INITIALIZE DATABASE
static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open([NoteSchema], 
    directory: dir.path,
    );
}

// list of notes
final List<Note> currentNotes=[];
  
//CREATE - a note from db. (asynchronous allows running of other tasks while waiting for the long task to complete.)
Future<void> addNote(String textFromUser) async{
  //create a new note object.
  final newNote = Note()..text = textFromUser;  //create a new note object and set its text property to the value of textFromUser.

  //save to db
  await isar.writeTxn(()  => isar.notes.put(newNote));

  //re-read from db
  fetchNotes(); 
}

  //READ - notes from db
 Future<void> fetchNotes() async{ 
    List<Note> fetchedNotes = await isar.notes.where().findAll();
    currentNotes.clear();
    currentNotes.addAll(fetchedNotes);
    notifyListeners();
  }

  //UPDATE
  Future<void> updateNote(int id, String newText) async{
    final existingNote = await isar.notes.get(id);
    if (existingNote != null){
      existingNote.text=newText;
      await isar.writeTxn(() => isar.notes.put(existingNote));
      await fetchNotes();
    }
  }


  //DELETE
Future<void> deleteNote(int id) async {
   await isar.writeTxn(() => isar.notes.delete(id)); 
   await fetchNotes(); 
  }
}