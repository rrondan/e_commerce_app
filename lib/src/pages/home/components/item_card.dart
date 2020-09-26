import 'package:e_commerce_app/src/models/product.dart';
import 'package:e_commerce_app/src/utils/constants.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {

  final Product product;
  final Function onTap;

  const ItemCard({Key key, this.product, this.onTap}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(defaultPadding),
            decoration: BoxDecoration(
              color: product.color,
              borderRadius: BorderRadius.circular(20.0)
            ),
            child: Hero(
              tag: "${product.id}",
              child: Image.asset(product.image)
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Text(product.title,
              style: TextStyle(
                color: textLightColor,
                fontSize: 15
              ),
            ),
          ),
          Text("S/${product.price}",
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
