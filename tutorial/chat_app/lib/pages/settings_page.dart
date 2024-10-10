import 'package:chat_app/themes/theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text("Settings"),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey,
        elevation: 0,
      ),
    body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:[
          //dark mode
          Text("Dark Mode"),
          
          //switch toggle
          CupertinoSwitch(
            value: Provider.of<ThemeProvider>(context, listen:false).isDarkMode,
            onChanged: (value)=> Provider.of<ThemeProvider>(context, listen:false).toggleTheme(),
          )
        ]
      ),
    )
    );
  }
}