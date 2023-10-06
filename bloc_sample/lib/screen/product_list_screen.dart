
import 'package:bloc_sample/bloc/cart_bloc.dart';
import 'package:bloc_sample/bloc/product_bloc.dart';
import 'package:flutter/material.dart';

import '../models/carts.dart';

class ProductListScreen extends  StatelessWidget{
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: const Text("Sepetimm"),
       actions: [
         IconButton(onPressed:() =>Navigator.pushNamed(context, "/cart"),
             icon: const Icon(Icons.shopping_cart))
       ],
     ),
     body: buildProductList(),
    
   );
  }

  buildProductList() {
    return StreamBuilder(
      initialData: ProductBloc.getAll(),
     stream: ProductBloc.getStream,
      builder: (context, snapshot){
        return snapshot.data!=null
            ? buildProductListItem(snapshot):const Center(
          child: Text("Data Yok"),
        );
    },
    );
  }

 Widget buildProductListItem(AsyncSnapshot snapshot) {
    return ListView.builder(
      itemCount: snapshot.data.length,
        itemBuilder: (BuildContext context, index){
       final list=snapshot.data;
       return ListTile(
         title: Text(list[index].name),
         subtitle: Text(list[index].price.toString()),
         trailing:IconButton(
            icon: Icon(Icons.shopping_cart),
             onPressed: () {
               CartBloc.addToCart(Cart(list[index],1));
             }
      ),
       );
        });
  }


}