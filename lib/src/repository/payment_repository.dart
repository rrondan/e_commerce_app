import 'package:e_commerce_app/src/repository/providers/payment_provider.dart';

class PaymentRepository {
  PaymentProvider _paymentProvider = new PaymentProvider();

  Future<String> getToken({String cardNumber, String cvv, String date}) =>
      _paymentProvider.getToken(cardNumber, cvv, date);

  Future<String> paymentCart({String tokenCart, double totalAmount}) =>
      _paymentProvider.paymentCart(tokenCart, totalAmount);

}