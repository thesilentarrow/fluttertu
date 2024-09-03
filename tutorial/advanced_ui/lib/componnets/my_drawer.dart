// ignore_for_file: prefer_const_constructors

import 'package:advanced_ui/componnets/my_list_tile.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                // drawer header logo
                DrawerHeader(
                  child: Center(
                    child: Icon(
                      Icons.shopping_bag,
                      size: 72,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                ),
                // shop tile
                MyListTile(
                  text: "Shop",
                  icon: Icons.home,
                  onTap: () {
                   Navigator.pop(context);
                   Navigator.pushNamed(context, '/shop_page'); 
                  },
                ),
                SizedBox(height: 10),
                MyListTile(
                  text: "Cart",
                  icon: Icons.add_shopping_cart_outlined,
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context,'/cart_page');
                  },
                ),
                SizedBox(height: 10),
                // cart tile
                // exit shop tile
              ],
            ),
          ),
          // Logout at the bottom
          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: MyListTile(
              text: "Logout",
              icon: Icons.logout,
              onTap: () {
                Navigator.pushNamed(context, '/intro_page');
              },
            ),
          ),
        ],
      ),
    );
  }
}