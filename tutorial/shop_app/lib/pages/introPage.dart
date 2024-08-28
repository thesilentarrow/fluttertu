// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:shop_app/pages/homePage.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.grey[300],
      body:Center(
        child:Padding(
          padding:EdgeInsets.symmetric(horizontal:25.0),
        
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children:[
          Image.asset(
            'lib/images/logo.png',
            height:240,
          ),     
          const SizedBox(height:48),
          Text("Just Do It 👉👌",
          style:TextStyle(
            fontWeight:FontWeight.bold,
            fontSize:20,
          )),
          const SizedBox(height:16),
          const Text('Brand new snickers and custom kicks made with custom quality', 
          style:TextStyle(
            fontSize:16,
            color:Colors.grey,
          ),
          textAlign:TextAlign.center,
          ),

          const SizedBox(height:48),
          GestureDetector(  //when the user clicks this button , then navigate him to next page
            onTap:()=>Navigator.push(
              context,
              MaterialPageRoute(
                builder:(context)=>HomePage(),
              )
            ),
            child: Container(
              decoration:BoxDecoration(
                color:Colors.grey[900],
                borderRadius: BorderRadius.circular(12),
                
              ),
              padding:const EdgeInsets.all(25),
              child:const Center(
                child:Text('Shop Now',
              style:TextStyle(
                color:Colors.white,
                fontWeight: FontWeight.bold,
                fontSize:16,
              )
              ),
              )
              
            ),
          )
        ]
        )
        )
      ),
    );
  }
}