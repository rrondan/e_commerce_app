import 'package:e_commerce_app/src/models/product.dart';
import 'package:e_commerce_app/src/pages/detail_product/components/button_add_to_cart.dart';
import 'package:e_commerce_app/src/pages/detail_product/components/color_and_size.dart';
import 'package:e_commerce_app/src/pages/detail_product/components/counter_with_fav_button.dart';
import 'package:e_commerce_app/src/utils/constants.dart';
import 'package:flutter/material.dart';

import 'description.dart';
import 'product_title_with_image.dart';

class BodyDetail extends StatelessWidget {
  final Product product;

  const BodyDetail({Key key,
    @required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Expanded(child: SizedBox()),
            Expanded(child: Container(color: Colors.white)),
          ],
        ),
        Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: _content(context),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _content(BuildContext context){
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(
            left: defaultPadding,
            right: defaultPadding,
            top: 100
          ),
          margin: EdgeInsets.only(top: size.height * 0.3),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30)
              )
          ),
          child: Column(
            children: [
              ColorAndSize(product: product),
              SizedBox(height: defaultPadding/2),
              Description(product: product),
              SizedBox(height: defaultPadding/2),
              CounterWithFavButton(product: product),
              SizedBox(height: defaultPadding/2),
              ButtonAddToCart(product: product),
              SizedBox(height: defaultPadding),
            ],
          ),
        ),
        ProductTitleWithImage(product: product),
      ],
    );
  }
}
