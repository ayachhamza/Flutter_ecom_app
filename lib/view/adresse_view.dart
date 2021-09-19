import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projet_last/constace.dart';
import 'package:projet_last/view/widgets/custom_button.dart';
import 'package:projet_last/view/widgets/custom_text.dart';
import 'package:projet_last/view/widgets/custom_text_form_field.dart';

class AdresseView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Les adresse de livraison',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              Container(
                color: Colors.red,
                height: 200,
              ),
              Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  CustomTextFormField(
                    text: 'Rue 1',
                    hint: 'Rue Nablousse david ',
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  CustomTextFormField(
                    text: 'Rue 2',
                    hint: 'Rue Nablousse david Snathon ',
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  CustomTextFormField(
                    text: 'Ville',
                    hint: 'Casablanca ',
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    width: Get.width,
                    child: Row(
                      children: [
                        Expanded(
                          child: CustomTextFormField(
                            text: 'Région',
                            hint: 'Casablanca ',
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: CustomTextFormField(
                            text: 'Pays',
                            hint: 'Maroc ',
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 150,
                        color: Colors.red,
                        alignment: Alignment.bottomLeft,
                        child: CustomButton(
                          onPress: () {},
                          color: primaryColor,
                          text: 'Annuler',
                        ),
                      ),
                      Container(
                        width: 150,
                        color: Colors.red,
                        alignment: Alignment.bottomRight,
                        child: CustomButton(
                          onPress: () {},
                          color: primaryColor,
                          text: 'Mis à jour',
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        )),
      ),
    );
  }
}
