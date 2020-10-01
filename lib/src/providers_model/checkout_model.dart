import 'package:e_commerce_app/src/repository/payment_repository.dart';
import 'package:flutter/cupertino.dart';

class CheckoutModel with ChangeNotifier{

  PaymentRepository _paymentRepository = new PaymentRepository();
  bool _isLoading = false;
  String _resultCheckout;

  bool get isLoading => _isLoading;
  String get resultCheckout => _resultCheckout;


  void checkoutSaleCart({String cardNumber, String cvv,
    String date, double totalAmount}) async{
    _isLoading = true; _resultCheckout = null;
    notifyListeners();
    try {
      //Primero obtendremos el token de la tarjeta
      String token = await _paymentRepository.getToken(
          cardNumber: cardNumber, cvv: cvv, date: date);
      if (token != "Ocurrio un error") {
        //Hacemos el payment
        String result = await _paymentRepository.paymentCart(
            tokenCart: token, totalAmount: totalAmount);
        _resultCheckout = result;
      } else {
        _resultCheckout = token;
      }
    } catch (e){
      print(e.toString());
    }

    _isLoading = false;
    notifyListeners();
  }

}