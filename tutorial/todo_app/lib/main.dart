import 'package:flutter/material.dart';
import 'pages/todo_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{
  await Hive.initFlutter(); //await is used to ensure that hive initialization gets completed before proceeding to enext line.
  await Hive.openBox('mybox');
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ToDoPage(),
      theme:ThemeData(
        primarySwatch: Colors.yellow,
        useMaterial3: false, //disabled it for more consistency with mitch tutorial 
        ),
    );
  }
}