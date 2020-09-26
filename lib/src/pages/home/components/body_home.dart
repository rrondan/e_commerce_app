import 'package:e_commerce_app/src/pages/home/components/list_product_widget.dart';
import 'package:e_commerce_app/src/utils/constants.dart';
import 'package:flutter/material.dart';

import 'categories_widget.dart';

class BodyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Text("Mujer",
            style: Theme.of(context).textTheme
                .headline5.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        CategoriesWidget(),
        Expanded(
          child: ListProductsWidget(),
        )
      ],
    );
  }
}
