import 'package:e_commerce_app/src/providers_model/sale_cart_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class ButtonSaleCart extends StatelessWidget {
  final Color colorIcon;

  const ButtonSaleCart({Key key, this.colorIcon = Colors.white})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/cart.svg",
            color: colorIcon,
          ),
          onPressed: () {
            Navigator.pushNamed(context, "shopping_cart");
          },
        ),
        Positioned(
          top: 9,
          right: 8,
          child: _redCircle(),
        )
      ],
    );
  }

  Widget _redCircle(){
    return Consumer<SaleCartModel>(
      builder: (BuildContext context, SaleCartModel saleCartModel, Widget child){
        if(saleCartModel.totalProducts > 0){
          return child;
        }
        return SizedBox();
      },
      child: Container(
        width: 12,
        height: 12,
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.red)),
    );
  }
}
