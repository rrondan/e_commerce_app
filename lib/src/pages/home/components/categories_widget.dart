import 'package:e_commerce_app/src/providers_model/products_model.dart';
import 'package:e_commerce_app/src/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoriesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ProductsModel productsModel = Provider.of<ProductsModel>(context);
    return Container(
      margin: EdgeInsets.symmetric(vertical: defaultPadding),
      height: 30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: productsModel.categories.length,
        itemBuilder: (BuildContext context, int index) =>
            _buildCategory(productsModel.categories[index], context),
      ),
    );
  }

  Widget _buildCategory(String category, BuildContext context){
    ProductsModel productsModel = Provider.of<ProductsModel>(context);
    return GestureDetector(
      onTap: () => productsModel.selectedCategory = category,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: defaultPadding),
        child: Column(
          children: [
            Text(category,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: productsModel.selectedCategory == category ?
                      textColor : textLightColor,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              height: 2,
              width: 30,
              color: productsModel.selectedCategory == category ?
                Colors.black : Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}
