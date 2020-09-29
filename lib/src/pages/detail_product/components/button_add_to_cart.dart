import 'package:e_commerce_app/src/models/product.dart';
import 'package:e_commerce_app/src/providers_model/products_model.dart';
import 'package:e_commerce_app/src/providers_model/sale_cart_model.dart';
import 'package:e_commerce_app/src/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class ButtonAddToCart extends StatelessWidget {
  final Product product;

  const ButtonAddToCart({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: defaultPadding),
      child: Row(
        children: [
          _iconButtonCart(context),
          Expanded(
            child: _buttonSellNow(context),
          )
        ],
      ),
    );
  }

  Widget _iconButtonCart(BuildContext context){
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
        onPressed: (){
          _addProductToSale(context);
          final snackbar = SnackBar(
            content: Text("Producto agregado al carrito"),
            action: SnackBarAction(
              label: "Ir Carrito",
              onPressed: () {
                Navigator.pushNamed(context, "shopping_cart");
              },
            ),
          );
          Scaffold.of(context).showSnackBar(snackbar);
        },
      ),
    );
  }

  Widget _buttonSellNow(BuildContext context){
    return SizedBox(
      height: 50,
      child: FlatButton(
        onPressed: (){
          _addProductToSale(context);
          Navigator.pushNamed(context, "shopping_cart");
        },
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

  void _addProductToSale(BuildContext context){
    ProductsModel productsModel = Provider.of<ProductsModel>(context, listen: false);
    SaleCartModel saleCartModel = Provider.of<SaleCartModel>(context, listen: false);
    saleCartModel.addProductToCart(
        product: product,
        quantity: productsModel.quantity
    );
  }
}
