import 'package:flutter/material.dart';

import '../../constace.dart';
import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final Function onPress;
  final String text;
  final Color color;
  final Color background;

  const CustomButton({
    required this.text,
    this.color = Colors.white,
    this.background = primaryColor,
    required this.onPress(),
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return FlatButton(
      padding: EdgeInsets.all(18),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      onPressed: () {},
      color: background,
      child: CustomText(
        color: color,
        align: Alignment.center,
        text: text,
      ),
    );
  }
}
