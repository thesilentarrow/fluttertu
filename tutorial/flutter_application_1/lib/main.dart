import 'package:flutter/material.dart';
void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  MyApp({super.key});
  void usertapped(){
    print("User tapped");
  }
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      
      home:Scaffold(
        body:Center(
          child: GestureDetector(
            onTap: usertapped,
            child:Container(
              height:300,
              width: 300,
              color: Colors.deepPurple[300],
                child: Center(
                  child: Text("tap me"),
                ),
            ),
          )
            
          
        )
      ),
      );
    
      
    
  }
}