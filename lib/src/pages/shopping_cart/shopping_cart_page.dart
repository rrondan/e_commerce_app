import 'package:e_commerce_app/src/utils/constants.dart';
import 'package:flutter/material.dart';

import 'components/body_shopping_cart.dart';

class ShoppingCartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appBarBuilding(context),
      body: BodyShoppingCart(),
    );
  }

  AppBar _appBarBuilding(BuildContext context){
    return AppBar(
      title: Text("Shopping Cart",
        style: TextStyle(color: textColor)),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.close),
        color: textColor,
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}
