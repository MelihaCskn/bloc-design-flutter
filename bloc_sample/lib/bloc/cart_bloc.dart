

import 'dart:async';

import 'package:bloc_sample/data/cart_services.dart';

import '../models/carts.dart';

class CartBloc{
 static final cartStreamController= StreamController.broadcast();

  static Stream get getStream=>cartStreamController.stream;

 static void addToCart(Cart item){
    CartServices.addToCart(item);
    cartStreamController.sink.add(CartServices.getCart());
  }
  static void removeToCart(Cart item){
    CartServices.removeFromCart(item);
    cartStreamController.sink.add(CartServices.getCart());
  }

  static List<Cart> getCart(){
return CartServices.getCart();
  }



}