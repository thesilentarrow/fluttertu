// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/cart.dart';
import 'pages/introPage.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {//wrap this inside change notifier provider(we are using provider)
    return ChangeNotifierProvider( 
      create: (context)=>Cart(),
      builder: (context,child)=>const MaterialApp(
        debugShowCheckedModeBanner: false,
        home:IntroPage(),
      ),
      );
  }
}
//       create:(context) => Cart(),
//       builder:(context, child)=>const MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home:IntroPage(),
//       ),
//     );
//   }
// }