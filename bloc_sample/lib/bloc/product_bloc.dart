
import 'dart:async';

import 'package:bloc_sample/data/product_services.dart';


import '../models/products.dart';

class ProductBloc{

  static final productBlocController=StreamController.broadcast();

  static Stream get getStream => productBlocController.stream;

  static List<Product> getAll(){
    return ProductServices.getAll();
  }


}