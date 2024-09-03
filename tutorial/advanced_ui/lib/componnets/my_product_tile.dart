import 'package:advanced_ui/models/product.dart';
import 'package:advanced_ui/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyProductTile extends StatelessWidget {
  final Product product;
  
  const MyProductTile({super.key, required this.product});

  //add to cart button pressed
  void addToCart(BuildContext context){
    // show a dialog box to ask user for confirmation
    showDialog(context:context, 
    builder:(context)=>AlertDialog(
      content: const Text('Add this item to your cart ?'),
      actions:[
        //cancel button
        MaterialButton(
          onPressed:()=>Navigator.pop(context),
          child:const Text('Cancel'),
        ),
        //yes button
        MaterialButton(
          onPressed:(){
            Navigator.pop(context);
            context.read<Shop>().addToCart(product);
          },
          child:const Text('Yes'),
        ),
      ],
    ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color:Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(10),
        ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(25),
      width: 300,
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:[
          //product image
          
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[  AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              ),
              width: double.infinity,
              padding: const EdgeInsets.all(25),
              child: Image.asset(product.imagePath),
            ),
            ),
          
          const SizedBox(height:25),
          //product name
          Text(product.name,
          style:const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          )),
          //product description
          const SizedBox(height: 10,),
          Text(product.description, style:TextStyle(color:Theme.of(context).colorScheme.inversePrimary)),
          
        ],),
          
          
          Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:[
          //product price + add to cart  
            Text('\$'+product.price.toStringAsFixed(2)),

            Container(
              decoration:BoxDecoration(
                color:Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(10),
              ),
              child:IconButton(onPressed:()=> addToCart(context), 
              icon:const Icon(Icons.add), ),
            ),
            
          ],
          ),
        ],
      )
    );
  }
}