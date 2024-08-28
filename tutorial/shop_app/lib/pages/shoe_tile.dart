// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:shop_app/models/shoe.dart';

//to display the shoe and prices :)
class ShoeTile extends StatelessWidget {
  Shoe shoe;
  void Function()? onTap;
  ShoeTile({super.key, required this.shoe, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:EdgeInsets.only(left:25, top: 25),
      width:280,
      
      decoration:BoxDecoration(
        color:Colors.grey[100],
        borderRadius:BorderRadius.circular(12),
      ),
      child:Column(
        mainAxisAlignment:MainAxisAlignment.spaceBetween,
        children: [
        //shoe pic
        Container(
          margin: EdgeInsets.only(top:30),
          child:ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.asset(
            shoe.imagePath,
            ),
          )
          
        ),
        //description
        Text(shoe.description, style:TextStyle(color:Colors.grey[600])),

        //price+details
        Padding(
          padding: const EdgeInsets.only(left:25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Column(
            crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Text(
                      shoe.name,
                      style:TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize:20,
                      )),
                    Text('\$'+shoe.price,
                    style:TextStyle(color:Colors.grey)),
                ]
              ),
              GestureDetector(
                onTap:onTap,
                child: Container(
                  padding: EdgeInsets.all(20),
                 
                  decoration: const BoxDecoration(
                    color:Colors.black,
                     borderRadius:BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                  ),
                   child: const Icon(
                    Icons.add,
                    color:Colors.white,
                    ),
                ),
              ),
             
            ],
          ),
        ),

       
        //button to add to cart

        ],
        
      ),
      
    ); 
    
  }
}