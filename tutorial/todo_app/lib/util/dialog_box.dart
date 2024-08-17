// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:new_project/util/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller; //to capture the text written in pop up box
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox({super.key, required this.controller, required this.onCancel, required this.onSave});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content:Container(
        height:120,
        child:Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // ignore: prefer_const_constructors
            TextField(
              controller:controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: "Add a new task",
          ),
        ),
        Row(
          mainAxisAlignment:MainAxisAlignment.end,

          children: [
            //two buttons for save and cancel
            MyButton(text: 'Save', onPressed: onSave),
            const SizedBox(width:8),
            MyButton(text: 'Cancel', onPressed: onCancel),
          ],
        ),
          ],
        )
        
        
      )
    );
  }
}