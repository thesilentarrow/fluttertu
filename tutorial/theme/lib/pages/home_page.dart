import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme/components/box.dart';
import 'package:theme/components/buttons.dart';
import 'package:theme/theme/theme_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blue[500],
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child:MyBox(
          color:Theme.of(context).colorScheme.primary,
          child:MyButton(
            color:Theme.of(context).colorScheme.secondary,
            onTap: () => {
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme(),
            },
            ),
        )),
    );
  }
}