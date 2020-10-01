import 'package:e_commerce_app/src/providers_model/checkout_model.dart';
import 'package:e_commerce_app/src/providers_model/sale_cart_model.dart';
import 'package:e_commerce_app/src/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class BodyCheckout extends StatelessWidget {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _numberCard;
  String _cvv;
  String _date;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Theme(
          data: Theme.of(context).copyWith(
            primaryColor: textColor
          ),
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 30, horizontal: 32),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _cardTextField(),
                  SizedBox(height: 16),
                  _cvvAndDateExpiration(),
                  SizedBox(height: 32),
                  _totalWidget(context),
                  SizedBox(height: 24),
                  _buttonPay(context),
                ],
              ),
            ),
          ),
        )
    );
  }

  Widget _cardTextField(){
    return TextFormField(
      keyboardType: TextInputType.number,
      inputFormatters: [
        WhitelistingTextInputFormatter.digitsOnly
      ],
      maxLength: 16,
      validator: (value){
        if(value.length< 14 || value.length > 16){
          return "Ingrese tarjeta valida";
        }
        return null;
      },
      onSaved: (value) => _numberCard = value,
      decoration: InputDecoration(
        labelText: "Ingrese número de tarjeta",
        counter: SizedBox(),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6)
        )
      ),
    );
  }

  Widget _cvvAndDateExpiration(){
    return Row(
      children: [
        Expanded(child: _cvvTextField()),
        SizedBox(width: 20),
        Expanded(child: _dateExpirationField()),
      ],
    );
  }

  Widget _cvvTextField(){
    return TextFormField(
      keyboardType: TextInputType.number,
      inputFormatters: [
        WhitelistingTextInputFormatter.digitsOnly
      ],
      validator: (value){
        if(value.length < 3){
          return "CVV incorrecto";
        }
        return null;
      },
      onSaved: (value) => _cvv = value,
      maxLength: 4,
      decoration: InputDecoration(
          labelText: "CVV",
          counter: SizedBox(),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)
          )
      ),
    );
  }

  Widget _dateExpirationField(){
    return TextFormField(
      keyboardType: TextInputType.number,
      maxLength: 7,
      validator: (value){
        if(value.length<7 || !value.contains("/")){
          return "Fecha incorrecta";
        }
        return null;
      },
      onSaved: (value) => _date = value,
      decoration: InputDecoration(
        hintText: "dd/aaaa",
        counter: SizedBox(),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)
      ),
      )
    );
  }

  Widget _totalWidget(BuildContext context){
    SaleCartModel saleCartModel = Provider.of<SaleCartModel>(context, listen: false);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Total a pagar: ",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: textColor,
            fontSize: 20
          ),
        ),
        Text("S/${saleCartModel.totalPriceCart.toStringAsFixed(2)}",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: textColor,
              fontSize: 20
          ),
        )
      ],
    );
  }

  Widget _buttonPay(BuildContext context) {
    return Consumer<CheckoutModel>(
      builder: (BuildContext context, CheckoutModel checkoutModel, Widget child){
        if(checkoutModel.isLoading){
          return Center(child: CircularProgressIndicator());
        } else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              child,
              SizedBox(height: 20),
              checkoutModel.resultCheckout != null ?
                  Text("Resultado: ${checkoutModel.resultCheckout}",
                  textAlign: TextAlign.center)
                  : SizedBox(),
            ],
          );
        }
      },
      child: SizedBox(
        height: 52,
        child: FlatButton(
          child: Text("Pagar",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
          ),
          color: Colors.redAccent,
          textColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6)
          ),
          onPressed: () => _checkout(context),
        ),
      ),
    );
  }

  void _checkout(BuildContext context){
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      double totalAmount = Provider.of<SaleCartModel>(context, listen: false).totalPriceCart;
      Provider.of<CheckoutModel>(context,listen: false).checkoutSaleCart(
        cardNumber: _numberCard, date: _date, cvv: _cvv,
        totalAmount: totalAmount
      );
    }
  }
}
