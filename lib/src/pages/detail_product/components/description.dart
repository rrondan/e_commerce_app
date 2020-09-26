import 'package:e_commerce_app/src/models/product.dart';
import 'package:e_commerce_app/src/utils/constants.dart';
import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  final Product product;

  const Description({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: defaultPadding),
      child: Text(
        product.description,
        style: TextStyle(
          fontSize: 15,
          height: 1.5
        ),
      ),
    );
  }
}
