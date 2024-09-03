import 'package:advanced_ui/pages/cart_page.dart';
import 'package:advanced_ui/pages/intro_page.dart';
import 'package:advanced_ui/pages/shop_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:advanced_ui/models/shop.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      create:(context)=>Shop(),
      child:const MyApp(),
    )
    );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.grey.shade200,
        colorScheme: ColorScheme.light(
          primary: Colors.grey.shade200,
          secondary: Colors.white,
          inversePrimary: Colors.grey.shade700,
          surface: Colors.grey.shade300, // Corrected the parameter name to set the surface color
        ),
      ),
      routes:{
        '/intro_page':(context)=>const IntroPage(),
        '/shop_page':(context)=>const ShopPage(),
        '/cart_page':(context)=>const CartPage(),
      },
      home: const IntroPage(), // Add the 'const' keyword to the constructor invocation
    );    
  }
}

