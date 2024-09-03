import 'package:advanced_ui/models/product.dart';
import 'package:flutter/material.dart';

class Shop extends ChangeNotifier{
  
  //products for sale
  //👇the 'product' inside list is an instance of the product class, the list will contain only the objects of class product.
  final List<Product> _shop=[
    //product 1
    Product(
      name:"Product 1",
      price:49.99,
      description:"Stay stylish with this trendy hoddie.",
      imagePath: 'assets/hoddie.jpg'
    ),
    Product(
      name:"Product 2",
      price:59.99,
      description:"Write in style with this sleek pen.",
      imagePath: 'assets/pen.jpg'
    ),
    Product(
      name:"Product 3",
      price:69.99,
      description:"Carry your essentials in this fashionable bag.",
      imagePath: 'assets/bag.jpg'
    ),
    Product(
      name:"Product 4",
      price:79.99,
      description:"Complete your look with these stylish glasses.",
      imagePath: 'assets/glasses.jpg'
    ),
  ];

  //user cart
List<Product> _cart=[];
  
  //get product list
List<Product> get shop => _shop;

  //get user cart
List<Product> get cart =>_cart;
 
  //add item to cart
void addToCart(Product item){
  _cart.add(item);
  notifyListeners();
}

  //delete item from cart
void removeFromCart(Product item){
  _cart.remove(item);
  notifyListeners();
}
} 