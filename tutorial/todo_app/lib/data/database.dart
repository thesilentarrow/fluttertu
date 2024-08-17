import 'package:hive_flutter/hive_flutter.dart';
import 'dart:developer' as developer;

class ToDoDataBase {
  List toDoList = [];
  final _myBox = Hive.box('mybox');

  void createInitialData() {
    toDoList = [
      ["Machine learning", false],
      ["Do exercise", false],
      ["Cigarretes After Sex", false],
    ];
  }

  // load the data from database
  void loadData() {
    toDoList = _myBox.get('TODOLIST');
    developer.log('\x1B[31mLoading the old data\x1B[0m');
  }

  // update the data in database
  void updateDataBase() {
    _myBox.put('TODOLIST', toDoList);
    developer.log('\x1B[31mDatabase is updated!!\x1B[0m');
  }
}