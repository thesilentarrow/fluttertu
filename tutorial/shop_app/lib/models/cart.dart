import 'package:flutter/material.dart';
import 'package:shop_app/models/shoe.dart';


class Cart extends ChangeNotifier{
  //list of shoes for sale
  List<Shoe> shoeshop=[
    Shoe(
      name:'Zoom FREAK',
      price:'236',
      description: 'The forward thinking design',
      imagePath: 'lib/images/shoe1.jpeg',
    ),
    Shoe(
      name:'Air Max 90',
      price:'150',
      description: 'Classic style meets modern comfort',
      imagePath: 'lib/images/shoe2.jpeg',
    ),
    Shoe(
      name:'Ultra Boost',
      price:'180',
      description: 'Responsive cushioning for endless energy',
      imagePath: 'lib/images/shoe3.jpeg',
    ),
    Shoe(
      name:'Stan Smith',
      price:'80',
      description: 'Clean and simple badass-inspired style',
      imagePath: 'lib/images/shoe4.jpeg',
    ),
  ];
  //list of items in user cart
  List<Shoe> userCart=[];
  
  //get list of shoes for sale
  List<Shoe> getShoeList(){
    return shoeshop;
  }

  //get cart
  List<Shoe> getCart(){
    return userCart;
  }

  //add items to cart
  void addItemToCart(Shoe shoe){
    userCart.add(shoe);
    notifyListeners(); //notify the listeners anytime we want to update the state. 
  }

  //remove items from cart
  void removeItemFromCart(Shoe shoe){
    userCart.remove(shoe);
    notifyListeners(); //noitfy the listeners anytime we want to update the state. 
  }
}