import 'package:e_commerce_app/src/models/product.dart';
import 'package:e_commerce_app/src/pages/detail_product/components/body_detail.dart';
import 'package:e_commerce_app/src/providers_model/products_model.dart';
import 'package:e_commerce_app/src/widgets/button_sale_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class DetailProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Product product = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: product.color,
      appBar: _appBar(),
      body: BodyDetail(product: product,),
    );
  }

  AppBar _appBar(){
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: [
        IconButton(
          icon: SvgPicture.asset("assets/icons/search.svg"),
          onPressed: (){},
        ),
        ButtonSaleCart(),
        SizedBox(width: 10),
      ],
    );
  }
}
