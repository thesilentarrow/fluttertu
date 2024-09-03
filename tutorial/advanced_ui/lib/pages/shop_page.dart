// ignore_for_file: unused_local_variable

import 'package:advanced_ui/componnets/my_drawer.dart';
import 'package:advanced_ui/componnets/my_product_tile.dart';
import 'package:advanced_ui/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatelessWidget {
const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    final products= context.watch<Shop>().shop;
    
    return Scaffold(
      appBar: AppBar(
        title:const Text('Shop Page'),
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions:[
          IconButton(onPressed:()=>Navigator.pushNamed(context,'/cart_page'), icon: Icon(Icons.shopping_cart_outlined))
        ]
        ),
        drawer:MyDrawer(),
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: SizedBox(
          height:550,
          child:ListView.builder(
          padding:EdgeInsets.all(15),
          itemCount: products.length,
          scrollDirection:Axis.horizontal,
          itemBuilder: (context,index){
          //get each individual product from shop
          final product = products[index];            
          
          //return as product tile UI
        return MyProductTile(product:product);
        }),
        ),
    );
  }
}