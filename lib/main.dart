import 'file:///D:/Desarrollo/Flutter_apps/e_commerce_app/lib/src/pages/home/home_page.dart';
import 'package:e_commerce_app/src/pages/detail_product/detail_product_page.dart';
import 'package:e_commerce_app/src/providers_model/checkout_model.dart';
import 'package:e_commerce_app/src/providers_model/products_model.dart';
import 'package:e_commerce_app/src/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/pages/checkout/checkout_page.dart';
import 'src/pages/shopping_cart/shopping_cart_page.dart';
import 'src/providers_model/sale_cart_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductsModel()),
        ChangeNotifierProvider(create: (_) => SaleCartModel()),
        ChangeNotifierProvider(create: (_) => CheckoutModel()),
      ],
      child: MaterialApp(
        title: 'E-commerce App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: Theme.of(context).textTheme.apply(bodyColor: textColor),
          visualDensity: VisualDensity.adaptivePlatformDensity
        ),
        initialRoute: "/",
        routes: {
          "/": (BuildContext context) => HomePage(),
          "product_detail": (_) => DetailProductPage(),
          "shopping_cart": (_) => ShoppingCartPage(),
          "checkout": (_) => CheckoutPage(),
        },
      ),
    );
  }
}
