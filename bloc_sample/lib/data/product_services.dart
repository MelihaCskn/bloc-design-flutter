
import '../models/products.dart';

class ProductServices{
 static List<Product> products=<Product>[];


 static final ProductServices _singleton= ProductServices._internal();

 factory ProductServices(){
   return _singleton;
 }

 ProductServices._internal();

 static List<Product> getAll(){
   products.add(Product(1, "asus", 1000));
   products.add(Product(2, "monster", 6000));
   products.add(Product(3, "lenovo", 4000));
   return products;

 }

}

