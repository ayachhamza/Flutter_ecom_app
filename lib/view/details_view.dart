import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:projet_last/constace.dart';
import 'package:projet_last/model/product_model.dart';
import 'package:projet_last/view/widgets/custom_button.dart';
import 'package:projet_last/view/widgets/custom_text.dart';

class DetailsScreen extends StatelessWidget {
  ProductModel model;

  DetailsScreen({this.model});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 270,
              child: Image.network(
                model.image,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(18),
                  child: Column(
                    children: [
                      CustomText(
                        text: model.name,
                        fontSize: 26,
                        weight: FontWeight.bold,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            padding: EdgeInsets.all(16),
                            width: MediaQuery.of(context).size.width * 0.4,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.grey)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CustomText(
                                  text: 'size',
                                ),
                                CustomText(
                                  text: model.sized,
                                )
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(16),
                            width: MediaQuery.of(context).size.width * 0.4,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.grey)),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  CustomText(
                                    text: 'Colore',
                                  ),
                                  Container(
                                    height: 20,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(20),
                                      color: model.color,
                                    ),
                                  )
                                ]),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomText(
                        text: 'Détails',
                        fontSize: 18,
                        weight: FontWeight.bold,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomText(
                        text: model.description,
                        height: 2.5,
                        fontSize: 18,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        child: CustomText(
                          text: 'PRIX',
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 35,
                          ),
                          CustomText(
                            fontSize: 18,
                            weight: FontWeight.bold,
                            color: primaryColor2,
                            text: model.price + '\ DH',
                          ),
                        ],
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(15),
                    height: 100,
                    width: 180,
                    child: CustomButton(
                      text: 'AJOUTER',
                      onPress: () {},
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
