import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomTextFormField extends StatelessWidget {
  final String text;

  final String hint;

  final Function onSaved;
  final Function validator;

  CustomTextFormField({
    this.text,
    this.hint,
    this.onSaved,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CustomText(
            text: text,
            color: Colors.black,
            fontSize: 14,
          ),
          TextFormField(
            onSaved: onSaved,
            validator: validator,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(
                color: Colors.grey,
              ),
              fillColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
