import 'package:e_commerce_app/src/models/product.dart';
import 'package:e_commerce_app/src/utils/constants.dart';
import 'package:flutter/material.dart';

class ProductTitleWithImage extends StatelessWidget {
  final Product product;

  const ProductTitleWithImage({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height*0.3 + 80,
      margin: EdgeInsets.symmetric(horizontal: defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Cartera Aristocratica",
            style: TextStyle(color: Colors.white),
          ),
          Text(product.title,
          style: Theme.of(context).textTheme.headline4
            .copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
          SizedBox(height: defaultPadding),
          Expanded(
            child: Row(
              children: [
                _priceText(context),
                SizedBox(width: 10),
                Expanded(child: _imageProduct())
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _priceText(BuildContext context){
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(text: "Price:\n"),
          TextSpan(
            text: "S/${product.price.toStringAsFixed(2)}",
            style: Theme.of(context).textTheme.headline4.copyWith(
              color: Colors.white, fontWeight: FontWeight.bold
            )
          )
        ]
      ),
    );
  }

  Widget _imageProduct(){
    return Hero(
      tag: product.id,
      child: Image.asset(
        product.image,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
