import 'package:flutter/material.dart';
import 'package:isar_todo_app/components/drawer.dart';
import 'package:isar_todo_app/components/note_tile.dart';
import 'package:isar_todo_app/models/note.dart';
import 'package:isar_todo_app/models/note_database.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  //text controller to access what the user typed
  final textController = TextEditingController();

  @override
  void initState(){ //this (initState) is called only once  
    super.initState();
    
    //on app startup, fetch the existing notes. 
    readNotes();
  }

  //create a note
  void createNote(){
    showDialog(
      context:context,
      builder:(context) => AlertDialog(
        content: TextField(
          controller: textController,
        ),
        actions:[
          //create button
          MaterialButton(
            onPressed:(){
              context.read<NoteDatabase>().addNote(textController.text);
              textController.clear();
              Navigator.pop(context);
            },
            child: const Text('Create'),
          )
        ]
      ),
    );
  }

  //read a note
  void readNotes(){
    context.read<NoteDatabase>().fetchNotes();
  }

  //update a note
  void updateNote(Note note){
    textController.text= note.text; //controller (What the heck)
    showDialog(
      context: context,
      builder:(context)=> AlertDialog(
        title: Text("Update Note"),
        content: TextField(controller: textController),
        actions:[
          MaterialButton(
            onPressed:(){
            context.read<NoteDatabase>().updateNote(note.id, textController.text);
            //clear controller
            textController.clear();
            //pop dialog
            Navigator.pop(context);
            },
            child: const Text("Update"),
          ),
        ]
      )
    );
  }

  //delete a note
  void deleteNote(Note note){
    textController.text=note.text;

    showDialog(
      context:context,
      builder:(context)=>AlertDialog(
        title: Text("Delete Note"),
        actions:[
          MaterialButton(
            onPressed:(){
              context.read<NoteDatabase>().deleteNote(note.id);
              textController.clear;
              Navigator.pop(context);
            },
            child: const Text('Delete'),
          ),
        ],
      )
    );
  }
  @override
  Widget build(BuildContext context) {
    // note database
    final noteDatabase = context.watch<NoteDatabase>();

    //current notes
    List<Note> currentNotes = noteDatabase.currentNotes;

    return Scaffold(
      appBar: AppBar(  
        elevation:0,
          iconTheme: IconThemeData(color: Theme.of(context).colorScheme.inversePrimary),

        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      floatingActionButton: FloatingActionButton(
        onPressed:(){
          createNote ();
        },
        child: Icon(Icons.add,
        color:Theme.of(context).colorScheme.inversePrimary),
      ),

      drawer:const MyDrawer(),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          Padding(
            padding:const EdgeInsets.only(left:25.0),
            child:Text(
              'Notes',
              style:GoogleFonts.dmSerifText(
                fontSize:48,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            )
          ),
          Expanded(
            child: ListView.builder(
        itemCount: currentNotes.length,
        itemBuilder:(context, index){
          //get individual note
          final note = currentNotes[index];
          
          //list tile UI
          return NoteTile(
            text: note.text,
            
            onEditPressed:()=> updateNote(note),
            onDeletePressed: ()=> deleteNote(note),
          );
        },
      )
          ),
        ]
      ) 
     
    );
  }
}