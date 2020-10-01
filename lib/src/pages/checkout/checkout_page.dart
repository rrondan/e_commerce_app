import 'package:e_commerce_app/src/utils/constants.dart';
import 'package:flutter/material.dart';

import 'components/body_checkout.dart';

class CheckoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildingAppbar(),
      body: BodyCheckout(),
    );
  }

  AppBar _buildingAppbar(){
    return AppBar(
      title: Text("Checkout", style: TextStyle(color: textColor)),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(
        color: textColor
      ),
    );
  }
}
