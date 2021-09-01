import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:projet_last/constace.dart';
import 'package:projet_last/core/view_model/cart_view_model.dart';
import 'package:projet_last/view/widgets/custom_button.dart';
import 'package:projet_last/view/widgets/custom_text.dart';

class CartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Expanded(
              child: GetBuilder<CartViewModel>(
                init: Get.find(),
                builder: (controller) => Container(
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height: 160,
                          child: Row(
                            children: [
                              Container(
                                width: 140,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.white),
                                child: Image.network(
                                  controller.cartProductModel[index].image,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 20, top: 35),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        text: controller
                                            .cartProductModel[index].name,
                                        fontSize: 18,
                                      ),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      CustomText(
                                        text:
                                            '${controller.cartProductModel[index].price.toString()} \DH',
                                        fontSize: 16,
                                        color: primaryColor2,
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        width: 140,
                                        height: 40,
                                        padding: EdgeInsets.all(3),

                                        //color: Colors.grey.shade200,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(9),
                                            color: Colors.grey.shade200),
                                        // decoration: BoxDecoration(
                                        //     borderRadius: BorderRadius.circular(20),
                                        //     border: Border.all(color: Colors.grey)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                controller
                                                    .icreaseQuantity(index);
                                              },
                                              child: Icon(
                                                Icons.add,
                                                color: Colors.black,
                                                size: 18,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 3),
                                              padding: EdgeInsets.only(
                                                  left: 10, right: 10),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(3),
                                                  color: Colors.grey.shade50),
                                              child: CustomText(
                                                align: Alignment.center,
                                                text: controller
                                                    .cartProductModel[index]
                                                    .quantity
                                                    .toString(),
                                                fontSize: 20,
                                                color: Colors.black,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                controller
                                                    .decreaseQuantity(index);
                                              },
                                              child: Icon(
                                                Icons.remove,
                                                size: 18,
                                                color: Colors.black,
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: controller.cartProductModel.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        SizedBox(
                      width: 20,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.grey.shade50,
                      blurRadius: 15.0,
                      offset: Offset(0.0, 0.75))
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        CustomText(
                          text: 'TOTALE',
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        GetBuilder<CartViewModel>(
                          init: Get.find(),
                          builder: (controller) => CustomText(
                            text: '${controller.totalPrice} \ DH',
                            color: primaryColor2,
                            weight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 100,
                      padding: EdgeInsets.all(20),
                      width: 180,
                      child: CustomButton(
                        color: primaryColor2,
                        text: 'CHECKOUT',
                        onPress: () {},
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
