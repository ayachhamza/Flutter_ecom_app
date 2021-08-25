import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final Alignment align;
  final FontWeight weight;

  CustomText({
    Key key,
    this.weight = FontWeight.normal,
    this.align,
    this.text,
    this.fontSize = 16,
    this.color = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: align == null ? Alignment.topLeft : align,
        child: Text(
          text,
          style: TextStyle(
            color: color,
            fontSize: fontSize,
            fontWeight: weight,
          ),
        ));
  }
}
