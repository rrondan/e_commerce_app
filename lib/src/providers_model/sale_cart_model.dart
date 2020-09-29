import 'package:e_commerce_app/src/models/product.dart';
import 'package:e_commerce_app/src/models/sale_cart_product.dart';
import 'package:flutter/cupertino.dart';

class SaleCartModel with ChangeNotifier{

  final List<SaleCartProduct> _saleCartProducts = new List();
  double _totalPriceCart = 0.0;

  List<SaleCartProduct> get saleCartProducts => _saleCartProducts;
  int get totalProducts => _saleCartProducts.length;
  double get totalPriceCart => _totalPriceCart;


  void addProductToCart({Product product, int quantity}){
    SaleCartProduct saleProduct = _saleCartProducts
        .firstWhere((item) => item.product.id == product.id, orElse: () => null);
    if(saleProduct == null){
      _saleCartProducts.add(SaleCartProduct(
        product: product,
        quantity: quantity
      ));
    } else {
      saleProduct.quantity = saleProduct.quantity + quantity;
    }
    _calculateTotalPrice();
    notifyListeners();
  }

  void addQuantity({SaleCartProduct saleCartProduct}){
    saleCartProduct.quantity++;
    _calculateTotalPrice();
    notifyListeners();
  }
  void removeQuantity({SaleCartProduct saleCartProduct}){
    if(saleCartProduct.quantity > 1){
      saleCartProduct.quantity--;
      _calculateTotalPrice();
      notifyListeners();
    }
  }

  void deleteSaleProductCart({SaleCartProduct saleCartProduct}){
    _saleCartProducts.remove(saleCartProduct);
    _calculateTotalPrice();
    notifyListeners();
  }

  void _calculateTotalPrice(){
    _totalPriceCart = 0.0;
    _saleCartProducts.forEach((item) {
      _totalPriceCart += (item.product.price * item.quantity);
    });
  }

}