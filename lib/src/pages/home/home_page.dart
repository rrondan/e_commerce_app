import 'package:e_commerce_app/src/pages/home/components/body_home.dart';
import 'package:e_commerce_app/src/utils/constants.dart';
import 'package:e_commerce_app/src/widgets/button_sale_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarBuilding(),
      body: BodyHome(),
    );
  }

  AppBar _appBarBuilding(){
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      actions: [
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/search.svg",
            color: textColor,
          ),
          onPressed: (){ },
        ),
        ButtonSaleCart(
          colorIcon: textColor,
        ),
        SizedBox(width: defaultPadding / 2),
      ],
    );
  }

}

