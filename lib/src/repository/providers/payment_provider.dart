import 'dart:convert';

import 'package:http/http.dart' as http;

class PaymentProvider{

  static final _apiKeyTest = "sk_test_0a53731c74028752";

  Future<String> getToken(String cardNumber, String cvv, String date) async{
    String url = "https://secure.culqi.com/v2/tokens";
    var body = {
      "card_number":cardNumber,
      "cvv":cvv,
      "expiration_month":date.split("/")[0],
      "expiration_year":date.split("/")[1],
      "email":"test2@test.com"
    };
    final resp = await http.post(url, headers: {
      "Authorization": "Bearer $_apiKeyTest",
      "Content-Type": "application/json"
    }, body: json.encode(body));
    if(resp.statusCode == 201) {
      final respData = json.decode(resp.body);
      print("GetToken: $respData");
      return respData["id"];
    } else {
      return "Ocurrio un error";
    }
  }

  Future<String> paymentCart(String tokenCart, double totalAmount) async{
    String url = "https://api.culqi.com/v2/charges";
    //"amount": (totalAmount*100).toInt().toString(),
    var body ={
      "amount": totalAmount.toStringAsFixed(2).replaceAll(".", ""),
      "currency_code": "PEN",
      "email": "test2@test.com",
      "source_id":tokenCart
    };
    final resp = await http.post(url, headers: {
      "Authorization": "Bearer $_apiKeyTest",
      "Content-Type": "application/json"
    }, body: json.encode(body));
    final respData = json.decode(resp.body);
    print("paymentCart: $respData");
    if(resp.statusCode == 200 || resp.statusCode == 201){
      return "success";
    } else {
      return respData["user_message"] ?? "Ocurrio un error";
    }
  }

}