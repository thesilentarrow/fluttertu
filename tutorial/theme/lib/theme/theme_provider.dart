import 'package:flutter/material.dart';
import 'package:theme/theme/theme.dart';

class ThemeProvider with ChangeNotifier{
  ThemeData _themeData = ThemeData(
    colorScheme:ColorScheme.light().copyWith(
      surface:Colors.grey.shade400,
      primary:Colors.grey.shade300,
      secondary:Colors.grey.shade200,
    )
  ); 
  ThemeData get themeData => _themeData;
  set themeData(ThemeData themeData){
      _themeData=themeData;
      notifyListeners();
  }

  void toggleTheme(){
    if (_themeData == ThemeData.light()){
        themeData=darkMode;
    }
    else{
      themeData=ThemeData(
      //   colorScheme: ColorScheme.light(
      //     surface:Colors.grey.shade400,
      // primary:Colors.grey.shade300,
      // secondary:Colors.grey.shade200,
      //   )
      );
    }
  }
}
