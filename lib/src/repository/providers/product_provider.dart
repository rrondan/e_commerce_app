import 'dart:ui';

import 'package:e_commerce_app/src/models/product.dart';

//Proveedor de data
class ProductProvider{

  Future<List<Product>> getProducts() async{
    await Future.delayed(Duration(seconds: 3));
    return _products;
  }

  Future<List<String>> getCategories() async{
    return _categories;
  }

}

List<String> _categories = [
  "Carteras",
  "Joyerias",
  "Calzado",
  "Vestidos"
];

//Data Fake
String _dummyText =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";

List<Product> _products = [
  Product(
      id: 1,
      title: "Office Code",
      price: 122.0,
      size: 12,
      description: _dummyText,
      image: "assets/images/bag_1.png",
      color: Color(0xFF3D82AE)),
  Product(
      id: 2,
      title: "Belt Bag",
      price: 150.0,
      size: 8,
      description: _dummyText,
      image: "assets/images/bag_2.png",
      color: Color(0xFFD3A984)),
  Product(
      id: 3,
      title: "Hang Top",
      price: 250.0,
      size: 10,
      description: _dummyText,
      image: "assets/images/bag_3.png",
      color: Color(0xFF989493)),
  Product(
      id: 4,
      title: "Old Fashion",
      price: 234.0,
      size: 11,
      description: _dummyText,
      image: "assets/images/bag_4.png",
      color: Color(0xFFE6B398)),
  Product(
      id: 5,
      title: "Office Code",
      price: 210.0,
      size: 12,
      description: _dummyText,
      image: "assets/images/bag_5.png",
      color: Color(0xFFFB7883)),
  Product(
    id: 6,
    title: "Office Code",
    price: 160.0,
    size: 12,
    description: _dummyText,
    image: "assets/images/bag_6.png",
    color: Color(0xFFAEAEAE),
  ),
];