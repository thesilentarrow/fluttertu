import 'package:flutter/material.dart';
import 'pages/first_page.dart';
void main(){  
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});
  void usertapped(){
    print("User tapped");
  }
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      
      home:FirstPage(),
      );
    
      
    
  }
}