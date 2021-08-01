import 'package:flutter/material.dart';
import 'package:projet_last/constace.dart';
import 'package:projet_last/view/widgets/custom_text.dart';
import 'package:projet_last/view/widgets/custom_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 50,
          left: 20,
          right: 20,
        ),
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: 'Bonjour',
                      fontSize: 30,
                    ),
                    CustomText(
                      text: 'Authentification',
                      fontSize: 18,
                      color: primaryColor2,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                CustomText(
                  text: 'Authentifier pour continuer',
                  color: Colors.grey,
                  fontSize: 14,
                ),
                SizedBox(
                  height: 52,
                ),
                CustomTextFormField(
                    text: 'Email',
                    hint: 'hamza@gmail.com',
                    onSave: () {},
                    validator: () {}),
                SizedBox(
                  height: 42,
                ),
                CustomTextFormField(
                    text: 'Mot de passe',
                    hint: '********',
                    onSave: () {},
                    validator: () {}),
                SizedBox(
                  height: 20,
                ),
                CustomText(
                  text: 'Mot de passe oblier?',
                  fontSize: 14,
                  align: Alignment.topRight,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
