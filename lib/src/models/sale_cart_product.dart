import 'package:e_commerce_app/src/models/product.dart';

class SaleCartProduct{
  Product product;
  int quantity;

  SaleCartProduct({this.product, this.quantity});

  double get totalPrice => product.price * (quantity*1.0);
}