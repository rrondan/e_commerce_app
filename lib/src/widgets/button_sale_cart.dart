import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
          onPressed: () {},
        ),
        Positioned(
          top: 8,
          right: 8,
          child: Container(
            width: 16,
            height: 16,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.red),
            child: Center(
              child: Text(
                "1",
                style: TextStyle(color: Colors.white, fontSize: 10),
              ),
            ),
          ),
        )
      ],
    );
  }
}
