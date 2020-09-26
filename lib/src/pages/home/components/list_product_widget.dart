import 'package:e_commerce_app/src/providers_model/products_model.dart';
import 'package:e_commerce_app/src/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'item_card.dart';

class ListProductsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ProductsModel productsModel = Provider.of<ProductsModel>(context);
    return productsModel.isLoading ? Center(child: CircularProgressIndicator())
      : Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        child: GridView.builder(
            itemCount: productsModel.products.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: defaultPadding,
              crossAxisSpacing: defaultPadding,
              childAspectRatio: 0.75
            ),
            itemBuilder: (BuildContext context, int index) =>
                ItemCard(
                  product: productsModel.products[index],
                  onTap: (){
                    Provider.of<ProductsModel>(context, listen: false).quantity = 1;
                    Navigator.pushNamed(context, "product_detail",
                        arguments: productsModel.products[index]);
                  },
                ),
          ),
      );
  }
}
