import 'package:e_commerce_app/src/models/product.dart';
import 'package:e_commerce_app/src/utils/constants.dart';
import 'package:flutter/material.dart';

class ColorAndSize extends StatelessWidget {
  final Product product;
  const ColorAndSize({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _colors(),
        ),
        Expanded(
          child: _size(context),
        )
      ],
    );
  }

  Widget _colors(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Color"),
        Row(
          children: [
            _ColorDot(color: Color(0xFF356C95), isSelected: true),
            _ColorDot(color: Color(0xFFF8C078)),
            _ColorDot(color: Color(0xFFA29B9B)),
          ],
        )
      ],
    );
  }

  Widget _size(BuildContext context){
    return RichText(
      text: TextSpan(
        style: TextStyle(color: textColor),
        children: <TextSpan>[
          TextSpan(text: "Size:\n"),
          TextSpan(
            text: "${product.size} cm",
            style: Theme.of(context).textTheme
              .headline5.copyWith(fontWeight: FontWeight.bold)
          )
        ]
      ),
    );
  }
}

class _ColorDot extends StatelessWidget {
  final Color color;
  final bool isSelected;

  const _ColorDot({Key key,
    @required this.color,
    this.isSelected = false
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 5,
        right: 10
      ),
      padding: EdgeInsets.all(2.5),
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? color : Colors.transparent
        )
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle
        ),
      ),
    );
  }
}

