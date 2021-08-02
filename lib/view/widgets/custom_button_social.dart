import 'package:flutter/material.dart';

class CustomButtonSocial extends StatelessWidget {
  final Color color;
  final String text;
  final String imageName;
  final Function onPress;

  const CustomButtonSocial({
    this.color = Colors.white,
    required this.text,
    required this.imageName,
    required this.onPress,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.shade100,
      ),
      // ignore: deprecated_member_use
      child: FlatButton(
          onPressed: onPress(),
          color: color,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Row(
            children: [
              Image.asset(imageName),
              SizedBox(
                width: 60,
              ),
              Text(text),
            ],
          )),
    );
  }
}
