import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:projet_last/constace.dart';
import 'package:projet_last/core/view_model/auth_view_model.dart';
import 'package:projet_last/view/auth/register_view.dart';
import 'package:projet_last/view/auth/second_screen.dart';

import 'package:projet_last/view/widgets/custom_button_social.dart';
import 'package:projet_last/view/widgets/custom_button.dart';
import 'package:projet_last/view/widgets/custom_text.dart';
import 'package:projet_last/view/widgets/custom_text_form_field.dart';

class LoginView extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color.fromRGBO(250, 250, 250, 1),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 50,
            left: 16,
            right: 16,
          ),
          child: Form(
            key: _formKey,
            child: Container(
              height: 670,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: 'Bonjour,',
                          fontSize: 33,
                          weight: FontWeight.bold,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(RegisterView());
                          },
                          child: CustomText(
                            text: 'Inscription',
                            fontSize: 18,
                            color: primaryColor2,
                          ),
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
                        onSaved: (value) {
                          controller.email = value;
                        },
                        validator: (value) {
                          if (value == null) {
                            print('ERROR');
                          }
                        }),
                    // TextFormField(
                    //   onSaved: (value) {
                    //     email = value;
                    //   },
                    //   validator: (value) {},
                    //   decoration: InputDecoration(
                    //     hintText: 'test',
                    //     hintStyle: TextStyle(
                    //       color: Colors.grey,
                    //     ),
                    //     fillColor: Colors.white,
                    //   ),
                    // ),
                    SizedBox(
                      height: 42,
                    ),

                    CustomTextFormField(
                        text: 'Mot de passe',
                        hint: '********',
                        onSaved: (value) {
                          controller.password = value;
                        },
                        validator: (value) {
                          if (value == null) {
                            print('ERROR PASSWORD');
                          }
                        }),
                    SizedBox(
                      height: 20,
                    ),
                    CustomText(
                      text: 'Mot de passe oublier?',
                      fontSize: 14,
                      align: Alignment.topRight,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                        text: 'Connecter',
                        onPress: () {
                          _formKey.currentState.save();
                          if (_formKey.currentState.validate()) {
                            controller.signInWithEmailAndPassword();
                            print('valid');
                          }
                        }),
                    SizedBox(height: 44),
                    CustomText(
                      text: '-OU-',
                      align: Alignment.center,
                    ),
                    SizedBox(
                      height: 43,
                    ),
                    CustomButtonSocial(
                        text: 'Connecter avec Facebook',
                        imageName: 'assets/images/facebook.png',
                        onPress: () {
                          // controller.facebookSignInMethode();
                        }),
                    SizedBox(
                      height: 20,
                    ),
                    CustomButtonSocial(
                        text: 'Connecter avec google',
                        imageName: 'assets/images/google.png',
                        onPress: () {
                          controller.googleSignInMethode();
                        }),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
