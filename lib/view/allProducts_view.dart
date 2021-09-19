import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projet_last/constace.dart';
import 'package:projet_last/core/view_model/home_view_model.dart';
import 'package:projet_last/view/widgets/custom_text.dart';

import 'details_view.dart';

class AllProductsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
        init: Get.find(),
        builder: (controller) => Scaffold(
              appBar: AppBar(
                //actionsIconTheme: Colors,
                backgroundColor: Colors.transparent,
                iconTheme: IconThemeData(color: Colors.black),
                // leading: Icon(
                //   Icons.navigate_before,
                //   color: Colors.black,
                //   Ta
                // ),
                elevation: 0,
                title: Text(
                  'Tous les produits',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              body: Container(
                padding: EdgeInsets.all(10),
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 300,
                      childAspectRatio: 3 / 5,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,

                      // crossAxisCount: 2,
                      // crossAxisSpacing: 8,
                      // mainAxisSpacing: 4
                    ),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    // gridDelegate:
                    //     const SliverGridDelegateWithFixedCrossAxisCount(
                    //         crossAxisCount: 2,
                    //         crossAxisSpacing: 20,

                    //         mainAxisSpacing: 20),
                    itemCount: controller.productModel.length,
                    itemBuilder: (BuildContext ctx, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.to(DetailsScreen(
                            model: controller.productModel[index],
                          ));
                        },
                        child: Flexible(
                          child: Container(
                            padding: EdgeInsets.only(bottom: 17, left: 10),
                            // child: Container(
                            //   alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                            ),
                            //   child: Text(controller.productModel[index].name),
                            // ),
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.white,
                                  ),
                                  height: 200,
                                  width: 200,
                                  child: Image.network(
                                      controller.productModel[index].image),
                                ),
                                Container(
                                  color: Colors.transparent,
                                  padding: EdgeInsets.all(10),
                                  child: CustomText(
                                    align: Alignment.center,
                                    text: controller.productModel[index].name,
                                    fontSize: 15,
                                    weight: FontWeight.w100,
                                  ),
                                ),
                                SizedBox(
                                  height: 1,
                                ),
                                Expanded(
                                  child: CustomText(
                                    text: controller
                                        .productModel[index].description,
                                    color: Colors.grey,
                                    align: Alignment.bottomLeft,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                CustomText(
                                  text: controller.productModel[index].price
                                          .toString() +
                                      " \DH",
                                  color: primaryColor2,
                                  align: Alignment.bottomLeft,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ));
  }
}
