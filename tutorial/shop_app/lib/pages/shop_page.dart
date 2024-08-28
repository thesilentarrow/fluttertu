// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/cart.dart';
import 'package:shop_app/models/shoe.dart';
import 'package:shop_app/pages/shoe_tile.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {

  void addShoeToCart(Shoe shoe){
    Provider.of<Cart>(context, listen:false).addItemToCart(shoe);
    showDialog(
      context: context, 
      builder: (context)=>AlertDialog(
        title:Text('Successfully added'),
        content: Text('The shoe has been added to the cart.'),
      ),);
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(builder: (context, value, child)=> //the provider is at cart model. which means this widget listens to changes in Cart model.
      Column(
      children:[
        Container(
         margin:EdgeInsets.symmetric(horizontal: 25),
         padding:EdgeInsets.all(12),
         decoration:BoxDecoration(color:Colors.grey[200], borderRadius:BorderRadius.circular(8)),
         child:Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Search",
            style:TextStyle(color:Colors.grey),
            ),
            Icon(
              Icons.search,
              color:Colors.grey,              
              ),
            ],       
         ),
        ),

        //message
        Padding(
          padding:EdgeInsets.symmetric(vertical:25),

          child:Text("Everyone flies.. some fly longer than others",
          style:TextStyle(color:Colors.grey),
          ),
        ),

        //hot picks
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('Hot picks 🔥',
              style:TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
              ),
              Text('See all',
              style:TextStyle(color:Colors.blue)),
            ],
          ),
        ),

        Expanded(
          child:ListView.builder(
            itemCount: 4,
            scrollDirection:Axis.horizontal,
            itemBuilder: (context, index){
              Shoe shoe= value.getShoeList()[index];
              return ShoeTile(
                  shoe: shoe,
                  onTap: ()=>addShoeToCart(shoe),
              );
            },
            ),
        ),
         Padding(
          padding: EdgeInsets.only(top:30.0),
         
          ),

      ],
    ),
 );
     }
}