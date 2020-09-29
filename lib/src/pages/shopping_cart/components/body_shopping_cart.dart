import 'package:e_commerce_app/src/pages/shopping_cart/components/item_shopping_cart.dart';
import 'package:e_commerce_app/src/providers_model/sale_cart_model.dart';
import 'package:e_commerce_app/src/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BodyShoppingCart extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: _ListProductSale(),
        ),
        _TotalAndCheckout(),
      ],
    );
  }
}

class _ListProductSale extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<SaleCartModel>(
      builder: (BuildContext context, SaleCartModel saleCartModel, Widget child){
        if(saleCartModel.saleCartProducts.isNotEmpty){
          return ListView.builder(
            padding: EdgeInsets.only(top: 8, bottom: 16),
            itemCount: saleCartModel.saleCartProducts.length,
            itemBuilder: (context, index) =>
                ItemShoppingCart(
                  saleCartProduct: saleCartModel.saleCartProducts[index],
                )
          );
        }
        return child;
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Llena tu carrito con productos de nuestra\ntienda de modas",
            style: TextStyle(
              color: textColor,
              fontSize: 16.0
            ),
            textAlign: TextAlign.center,),
            SizedBox(
              height: 50,
              child: FlatButton(
                child: Text("Comprar Ahora",
                    style: TextStyle(fontSize: 17,
                  fontWeight: FontWeight.bold)),
                textColor: Colors.white,
                color: Colors.redAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                onPressed: () => Navigator.pop(context),
              ),
            )
          ],
        ),
      )
    );
  }
}

class _TotalAndCheckout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SaleCartModel saleCartModel = Provider.of<SaleCartModel>(context);
    return saleCartModel.totalProducts == 0 ? SizedBox() :
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0,-3),
            spreadRadius: 2,
            blurRadius: 3
          )
        ]
      ),
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _totalPrice(),
          SizedBox(height: 16),
          _checkoutButton()
        ],
      ),
    );
  }

  Widget _totalPrice(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Total a pagar: ", style: TextStyle(fontSize: 16)),
        Consumer<SaleCartModel>(
          builder: (BuildContext context, SaleCartModel saleCartModel, Widget child){
            return Text("S/${saleCartModel.totalPriceCart.toStringAsFixed(2)}",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold));
          },
        ),
      ],
    );
  }

  Widget _checkoutButton(){
    return SizedBox(
      height: 50,
      child: FlatButton(
        child: Text("Checkout",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
            )
          ),
        color: Colors.redAccent,
        textColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        onPressed: (){},
      ),
    );
  }
}


