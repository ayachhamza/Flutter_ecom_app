import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomButtonSocial extends StatelessWidget {
  final String text;
  final String imageName;
  final VoidCallback onPress;

  CustomButtonSocial({
    this.text,
    this.imageName,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11),
        color: Colors.grey.shade100,
      ),
      // ignore: deprecated_member_use
      child: FlatButton(
        onPressed: onPress,
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(10.0),
        ),
        child: Row(
          children: [
            Image.asset(imageName),
            SizedBox(
              width: 60,
            ),
            CustomText(
              text: text,
            ),
          ],
        ),
      ),
    );
  }
}
