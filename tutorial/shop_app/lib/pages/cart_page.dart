import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/components/cart_item.dart';
import 'package:shop_app/models/cart.dart';
import 'package:shop_app/models/shoe.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>( //the Consumer<Cart> widget listens to the changes in the cart model.
      builder:(context, value, child)=>Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.0),
        child:Column(
          children:[
            const Text(
              'My Cart',
              style:TextStyle(fontWeight: FontWeight.bold, fontSize:25.0),
            ),
            const SizedBox(height: 10),
            Expanded(child: ListView.builder(
              itemCount: value.getCart().length,
              itemBuilder: (context, index){//building the list
                Shoe individualShoe = value.getCart()[index]; 
                return CartItem(
                  shoe:individualShoe
                );
            },
            ),
            ),
          ]
        )
      )
    );
  }
}