import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:projet_last/core/view_model/auth_view_model.dart';
import 'package:projet_last/view/auth/login_view.dart';
import 'package:projet_last/view/widgets/custom_button.dart';
import 'package:projet_last/view/widgets/custom_button_social.dart';
import 'package:projet_last/view/widgets/custom_text.dart';
import 'package:projet_last/view/widgets/custom_text_form_field.dart';

import '../../constace.dart';

class RegisterView extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Color.fromRGBO(250, 250, 250, 1),
          leading: GestureDetector(
            onTap: () {
              Get.to(LoginView());
            },
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
          )),
      body: Padding(
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
                        text: 'Inscription',
                        fontSize: 33,
                        weight: FontWeight.bold,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 52,
                  ),
                  CustomTextFormField(
                      text: 'Nom et prénom',
                      hint: 'Hamza AYACH',
                      onSaved: (value) {
                        controller.name = value;
                      },
                      validator: (value) {
                        if (value == null) {
                          print('ERROR PASSWORD');
                        }
                      }),
                  SizedBox(
                    height: 42,
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
                  SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                      text: 'Inscription',
                      onPress: () {
                        _formKey.currentState.save();
                        if (_formKey.currentState.validate()) {
                          controller.createAccountWithEmailAndPassword();
                          print('emai');
                        }
                      }),
                  SizedBox(height: 44),
                  SizedBox(
                    height: 43,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
