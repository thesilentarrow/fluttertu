import 'package:flutter/material.dart';

ThemeData lightmode=ThemeData(
  brightness:Brightness.light,
  colorScheme:ColorScheme.light( //dont know why the fuck is this light mode colors not registering. 
    surface: Colors.orange.shade400,
    primary:Colors.orange.shade300,
    secondary:Colors.orange.shade200,
  ),
);
ThemeData darkMode=ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    surface: Colors.grey.shade900,
    primary:Colors.grey.shade800,
    secondary:Colors.grey.shade700,
  ),
);


