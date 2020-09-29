import 'package:e_commerce_app/src/models/sale_cart_product.dart';
import 'package:e_commerce_app/src/providers_model/sale_cart_model.dart';
import 'package:e_commerce_app/src/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemShoppingCart extends StatelessWidget {
  final SaleCartProduct saleCartProduct;

  const ItemShoppingCart({Key key, this.saleCartProduct})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Row(
            children: [
              _imageProduct(),
              SizedBox(width: 12),
              Expanded(
                child: _dataProduct(context),
              )
            ],
          ),
          Positioned(
            top: 0, right: 0,
            child: IconButton(
              icon: Icon(Icons.delete),
              color: textColor,
              onPressed: (){
                Provider.of<SaleCartModel>(context, listen: false)
                    .deleteSaleProductCart(saleCartProduct: saleCartProduct);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _imageProduct(){
    return Container(
      height: 160, width: 160,
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
          color: saleCartProduct.product.color,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            bottomLeft: Radius.circular(20)
          )
      ),
      child: Image.asset(saleCartProduct.product.image),
    );
  }

  Widget _dataProduct(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(saleCartProduct.product.title,
          style: Theme.of(context).textTheme.headline5
            .copyWith(color: textColor, fontWeight: FontWeight.bold),
        ),
        Text("Tamaño: ${saleCartProduct.product.size} cm"),
        Text("Precio unitario: S/${saleCartProduct.product.price.toStringAsFixed(2)}"),
        SizedBox(height: 12),
        Text("Seleccione cantidad: "),
        _quantityProduct(context),
      ],
    );
  }

  Widget _quantityProduct(BuildContext context){
    return Row(
      children: [
        _buildButton(
          icon: Icons.remove,
          onPressed: () =>
              Provider.of<SaleCartModel>(context, listen: false).removeQuantity(
                saleCartProduct: saleCartProduct
              )
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            "${saleCartProduct.quantity}",
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        _buildButton(
          icon: Icons.add,
          onPressed: ()=>
              Provider.of<SaleCartModel>(context, listen: false).addQuantity(
                  saleCartProduct: saleCartProduct
              )
        ),
      ],
    );
  }

  Widget _buildButton({IconData icon, Function onPressed}){
    return SizedBox(
      height: 32,
      width: 32,
      child: OutlineButton(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13)
        ),
        onPressed: onPressed,
        child: Icon(icon, size: 18,),
      ),
    );
  }
}
