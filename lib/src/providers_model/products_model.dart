import 'package:e_commerce_app/src/models/product.dart';
import 'package:e_commerce_app/src/repository/product_repository.dart';
import 'package:flutter/material.dart';


class ProductsModel extends ChangeNotifier {

  final ProductRepository _productRepository = new ProductRepository();
  final List<Product> _products = new List();
  final List<String> _categories = new List();
  String _selectedCategory = "Carteras";
  bool _isLoading = false;

  int _quantity = 1;

  List<Product> get products => _products;
  List<String> get categories => _categories;
  bool get isLoading => _isLoading;
  String get selectedCategory => _selectedCategory;
  set selectedCategory(value){
    _selectedCategory = value;
    notifyListeners();
  }
  int get quantity => _quantity;
  set quantity(value){
    _quantity = value;
    notifyListeners();
  }

  void removeQuantity(){
    if(_quantity > 1){
      _quantity--;
      notifyListeners();
    }
  }

  void addQuantity(){
    _quantity++;
    notifyListeners();
  }

  ProductsModel(){
    this.getCategories();
    this.getProducts();
  }

  getProducts() async {
    _isLoading = true;
    notifyListeners();

    List<Product> results = await _productRepository.getProducts();
    products.clear();
    products.addAll(results);

    _isLoading = false;
    notifyListeners();
  }

  getCategories() async{
    List<String> results = await _productRepository.getCategories();
    categories.clear();
    categories.addAll(results);
    notifyListeners();
  }
}