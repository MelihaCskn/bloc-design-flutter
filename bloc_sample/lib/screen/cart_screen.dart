
import 'package:flutter/material.dart';

import '../bloc/cart_bloc.dart';


class CartScreen extends  StatelessWidget{
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ALIŞVERİŞ"),
      ),
      body: buildCartList(),

    );
  }

  buildCartList() {
    return StreamBuilder(
      initialData: CartBloc.getCart(),
      stream: CartBloc.getStream,
      builder: (context, snapshot){
        return snapshot.data!=null
            ? buildCart(snapshot):const Center(
          child: Text("Data Yok"),
        );
      },
    );
  }

  Widget buildCart(AsyncSnapshot snapshot) {
    return ListView.builder(
        itemCount: snapshot.data.length,
        itemBuilder: (BuildContext context, index){
          final cart=snapshot.data;
          return ListTile(
            title: Text(cart[index].product.name.toString()),
            subtitle: Text(cart[index].product.price.toString()),
            trailing:IconButton(
                icon: Icon(Icons.remove_shopping_cart),
                onPressed: () {
                  CartBloc.removeToCart(cart[index]);
               showDialog(
                   context: context,
                   builder: (BuildContext context){
          return AlertDialog(
          title: new Text("ÜRÜN SİLİNDİ"),
          );


                }

          );
            }));
  }
    );

}

}