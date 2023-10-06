
import '../models/carts.dart';

class CartServices{

  static List<Cart> cartitems= <Cart>[];


  static void addToCart(Cart item){
    cartitems.add(item);
  }
   static void removeFromCart(Cart item){
    cartitems.remove(item);
   }

   static List<Cart> getCart(){
    return cartitems;
  }

}