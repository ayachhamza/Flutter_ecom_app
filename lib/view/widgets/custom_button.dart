import 'package:flutter/material.dart';

import 'package:projet_last/constace.dart';
import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final String text;

  final Color color;

  final VoidCallback onPress;

  CustomButton({
    @required this.onPress,
    this.text = 'Write text ',
    this.color = primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return FlatButton(
      shape: new RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(10.0),
      ),
      padding: EdgeInsets.all(10),
      onPressed: onPress,
      color: primaryColor,
      height: 55,
      child: CustomText(
        align: Alignment.center,
        text: text,
        color: Colors.white,
      ),
    );
  }
}
