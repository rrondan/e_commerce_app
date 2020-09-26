import 'package:e_commerce_app/src/models/product.dart';

import 'providers/product_provider.dart';

class ProductRepository{

  ProductProvider _productProvider = new ProductProvider();

  Future<List<Product>> getProducts() => _productProvider.getProducts();
  Future<List<String>> getCategories() => _productProvider.getCategories();

}