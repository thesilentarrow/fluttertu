import 'package:flutter/material.dart';
import 'package:isar_todo_app/components/drawer_tile.dart';
import 'package:isar_todo_app/pages/settings.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child:Column(
        children:[
          //header
          DrawerHeader(
            child:Icon(Icons.edit,
            color: Theme.of(context).colorScheme.inversePrimary,),
          ),
          //notes tile
          DrawerTile(
            title:"Notes",
            leading:Icon(Icons.home,
            color:Theme.of(context).colorScheme.inversePrimary,),
            onTap:(){
              Navigator.pop(context);
            },
          ),
          //settings tile
          DrawerTile(
            title:"Settings",
            leading:Icon(Icons.settings,
            color: Theme.of(context).colorScheme.inversePrimary),
            onTap:(){
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingsPage()));
            },
          )
          //logout tile
        ],
      ),
    );
  }
}