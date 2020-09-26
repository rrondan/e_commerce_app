import 'package:e_commerce_app/src/models/product.dart';
import 'package:e_commerce_app/src/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ButtonAddToCart extends StatelessWidget {
  final Product product;

  const ButtonAddToCart({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: defaultPadding),
      child: Row(
        children: [
          _iconButtonCart(),
          Expanded(
            child: _buttonSellNow(),
          )
        ],
      ),
    );
  }

  Widget _iconButtonCart(){
    return Container(
      margin: EdgeInsets.only(right: defaultPadding),
      width: 58, height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: product.color,
        ),
      ),
      child: IconButton(
        icon: SvgPicture.asset("assets/icons/add_to_cart.svg"),
        color: product.color,
        onPressed: (){ },
      ),
    );
  }

  Widget _buttonSellNow(){
    return SizedBox(
      height: 50,
      child: FlatButton(
        onPressed: (){},
        color: product.color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18)
        ),
        child: Text(
          "Comprar Ahora".toUpperCase(),
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
        ),
      ),
    );
  }
}
