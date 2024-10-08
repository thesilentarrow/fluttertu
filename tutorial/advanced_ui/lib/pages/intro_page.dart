import 'package:advanced_ui/componnets/my_button.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(
              Icons.shopping_bag,
              size:72,
              color:Theme.of(context).colorScheme.inversePrimary,
              ),
            //title
            const SizedBox(height:25),
            const Text("Minimal Shop",
            style:TextStyle(
              fontWeight:FontWeight.bold,
              fontSize:20,
            ),
            ),
            const SizedBox(height:10),
            //subtitle
            Text("Premium quality products",
            style:TextStyle(color:Theme.of(context).colorScheme.inversePrimary),
            ),
            const SizedBox(height:25),
            //button
            MyButton(onTap:()=>Navigator.pushNamed(context,'/shop_page'), 
            child:Icon(Icons.arrow_forward)
            ),
          ],
        ),
      )
    );
  }
}