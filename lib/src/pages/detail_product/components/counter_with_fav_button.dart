import 'package:e_commerce_app/src/models/product.dart';
import 'package:e_commerce_app/src/providers_model/products_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class CounterWithFavButton extends StatelessWidget {
  final Product product;

  const CounterWithFavButton({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CardCounter(),
        Container(
          padding: EdgeInsets.all(8),
          height: 32,
          width: 32,
          decoration: BoxDecoration(
            color: Color(0xFFFF6464),
            shape: BoxShape.circle
          ),
          child: SvgPicture.asset("assets/icons/heart.svg"),
        )
      ],
    );
  }
}

class CardCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildButton(
          icon: Icons.remove,
          onPressed: () => Provider.of<ProductsModel>(context,listen: false).removeQuantity(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Consumer<ProductsModel>(
            builder: (BuildContext context, ProductsModel productsModel, Widget child){
              return Text(
                "${productsModel.quantity}",
                style: Theme.of(context).textTheme.headline6,
              );
            },
          ),
        ),
        buildButton(
            icon: Icons.add,
            onPressed: () => Provider.of<ProductsModel>(context,listen: false).addQuantity(),
        ),
      ],
    );
  }

  Widget buildButton({IconData icon, Function onPressed}){
    return SizedBox(
      height: 32,
      width: 40,
      child: OutlineButton(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13)
        ),
        onPressed: onPressed,
        child: Icon(icon),
      ),
    );
  }
}

