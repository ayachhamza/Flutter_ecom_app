import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projet_last/view/widgets/custom_text.dart';
import 'package:projet_last/view/widgets/custom_text_form_field.dart';

class AddAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            CustomText(
              text: 'Adresse de Livraison',
              fontSize: 20,
              align: Alignment.center,
            ),
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
            )
          ],
        ),
      ),
    );
  }
}
