import 'package:chat_app/auth/auth_service.dart';
import 'package:chat_app/pages/settings_page.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout(){
    final _auth = AuthService();
    _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:[
          Column(
            children: [
              DrawerHeader(
                child: Center(
                  child: Icon(
                    Icons.message,
                    color: Theme.of(context).colorScheme.primary,
                    size:40
                    )),
              ),
                      //home list tile
                      Padding(
              padding: const EdgeInsets.only(left:25.0),
              child: ListTile(
                title: Text("H O M E"),
                leading: Icon(Icons.home),
                onTap:(){
                  Navigator.pop(context);
                }
              ),
                      ),
                      //settings list tile
                      Padding(
              padding: const EdgeInsets.only(left:25.0),
              child: ListTile(
                title: Text("S E T T I N G S"),
                leading: Icon(Icons.settings),
                onTap:(){
                  Navigator.pop(context);
                  //Navigate to settings page
                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder:(context)=> SettingsPage(),
                    ),
                  );
                }
              ),
                      ),
            ],
          ),
        //logout list tile
        Padding(
          padding: const EdgeInsets.only(left:25.0, bottom:25.0),
          child: ListTile(
            title: Text("L O G O U T"),
            leading: Icon(Icons.logout),
            onTap:logout,
          ),
        ),
        ],
      )
    );
  }
}