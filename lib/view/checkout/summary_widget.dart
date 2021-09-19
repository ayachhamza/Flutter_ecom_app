import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/default_transitions.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:projet_last/core/view_model/cart_view_model.dart';
import 'package:projet_last/model/cart_product_model.dart';
import 'package:projet_last/view/checkout/add_address_widget.dart';
import 'package:projet_last/view/widgets/custom_text.dart';

import '../../constace.dart';

class Summary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GetBuilder<CartViewModel>(
        builder: (controller) => Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Container(
              padding: EdgeInsets.all(20),
              height: 300,
              color: Colors.white,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Container(
                  width: MediaQuery.of(context).size.width * .4,
                  padding: EdgeInsets.only(bottom: 17, left: 10),
                  // child: Container(
                  //   alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                        ),
                        child: Container(
                            height: 180,
                            color: Colors.white,
                            width: MediaQuery.of(context).size.width * .4,
                            child: Image.network(
                              controller.cartProductModel[index].image,
                              fit: BoxFit.fitWidth,
                            )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: controller.cartProductModel[index].name,
                        align: Alignment.bottomLeft,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: controller.cartProductModel[index].price
                                .toString() +
                            " \DH",
                        color: primaryColor2,
                        align: Alignment.bottomLeft,
                      ),
                    ],
                  ),
                ),
                itemCount: controller.cartProductModel.length,
                separatorBuilder: (context, index) => SizedBox(
                  width: 20,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: CustomText(
                text: 'Adresse de Livraison',
                weight: FontWeight.w600,
                fontSize: 20,
                align: Alignment.topLeft,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            RadioListTile(
              value: null,
              groupValue: null,
              onChanged: (value) {},
              title: CustomText(
                text: 'Adresse 1',
                fontSize: 24,
              ),
              subtitle: CustomText(
                text: '\n Berrechi 1 ,Berrechid, Région Casablanca, Maroc',
                fontSize: 15,
              ),
              activeColor: primaryColor2,
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.only(left: 50, top: 25),
                child: CustomText(
                  text: 'Changer',
                  color: primaryColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
