import 'package:advanced_ui/componnets/my_button.dart';
import 'package:advanced_ui/models/product.dart';
import 'package:advanced_ui/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key, });

  //remove item from cart method
  void removeItemsFromCart(BuildContext context, Product product){
    // dialog box to ask user to confirm to add to cart
    showDialog(
      context:context,
      builder: (context)=> AlertDialog(
        content: Text("Remove this item from your cart?"),
        actions:[
          //cancel button
          MaterialButton(
            onPressed:(){
              Navigator.pop(context);
              context.read<Shop>().removeFromCart(product);
            },
            child:const Text("Remove"),
          ),
        ],
      )
    );
  }

  //user pressed the pay button
  void payButtonPressed(BuildContext context){
    showDialog(context: context, builder:(context)=> const AlertDialog(
        content:Text("User wants to pay, Connect this app to your payment"),
    )
    );
  }

  @override
  Widget build(BuildContext context) {
    //get access to the cart
    final cart = context.watch<Shop>().cart;


    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart Page'),
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        children:[
          Expanded(
            child: cart.isEmpty
            ? const Center(child: Text("Your cart is empty.."))               
            : ListView.builder(
              itemCount:cart.length,
              itemBuilder: (context, index){
                final item = cart[index];

                //return as a cart tile UI
                return ListTile(
                  title:Text(item.name),
                  subtitle:Text(item.price.toStringAsFixed(2)),
                  trailing: IconButton(onPressed:()=> removeItemsFromCart(context, item), 
                  icon: const Icon(Icons.remove)),
                );
              },
              )
          ),

          Padding(
            padding: const EdgeInsets.all(50.0),
            child: MyButton(
              onTap:()=>payButtonPressed(context),
              child: const Text("PAY NOW"),
            ),
          ),
        ],
      ),
    );
  }
}