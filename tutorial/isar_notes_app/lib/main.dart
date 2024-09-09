import 'package:flutter/material.dart';
import 'package:isar_todo_app/models/note_database.dart';
import 'package:isar_todo_app/pages/notes_page.dart';
import 'package:provider/provider.dart';
import 'pages/notes_page.dart';
import 'theme/theme_provider.dart';


void main() async{
  //**initializing note isar database**
  WidgetsFlutterBinding.ensureInitialized();
  await NoteDatabase.initialize();
  
  runApp(
    MultiProvider(
      providers:[
        //Note Provider
        ChangeNotifierProvider(create:(context)=>NoteDatabase()),
        //Theme Provider
        ChangeNotifierProvider(create:(context)=>ThemeProvider()),
      ],
      child:const MyApp(),
    ),
    );
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
 
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: const NotesPage(),
    );
  }
}

