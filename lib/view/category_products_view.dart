import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:projet_last/constace.dart';
import 'package:projet_last/core/view_model/home_view_model.dart';
import 'package:projet_last/model/cart_product_model.dart';
import 'package:projet_last/model/category_model.dart';
import 'package:projet_last/model/product_model.dart';
import 'package:projet_last/core/view_model/cart_view_model.dart';
import 'package:projet_last/view/widgets/custom_button.dart';
import 'package:projet_last/view/widgets/custom_text.dart';

class CategoryProductsView extends StatelessWidget {
  CategoryModel model;
  int gridViewCrossAxisCount = 3;

  CategoryProductsView({this.model});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => Container(
        color: Colors.white,
        height: 350,
        child: GridView.builder(
          itemCount: controller.productModel.length,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          controller: new ScrollController(keepScrollOffset: false),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: (3 / 4),
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.to(CategoryProductsView(
                  model: controller.categoryModel[index],
                ));
              },
              child: Container(
                decoration: myBoxDecoration(index, gridViewCrossAxisCount),
                width: MediaQuery.of(context).size.width * .4,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.grey.shade100,
                      ),
                      child: Container(
                          height: 220,
                          color: Colors.white,
                          width: MediaQuery.of(context).size.width * .4,
                          child: Image.network(
                            controller.productModel[index].image,
                            fit: BoxFit.fill,
                          )),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomText(
                      text: controller.productModel[index].name,
                      align: Alignment.bottomLeft,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: CustomText(
                        text: controller.productModel[index].description,
                        color: Colors.grey,
                        align: Alignment.bottomLeft,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomText(
                      text: controller.productModel[index].price.toString() +
                          " \DH",
                      color: primaryColor,
                      align: Alignment.bottomLeft,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  BoxDecoration myBoxDecoration(int index, int gridViewCrossAxisCount) {
    index++;
    return BoxDecoration(
      color: Colors.green,
      border: Border(
        left: BorderSide(
          //                   <--- left side
          color: index % gridViewCrossAxisCount != 0
              ? Colors.black12
              : Colors.transparent,
          width: 1.5,
        ),
        top: BorderSide(
          //                   <--- left side
          color: index > gridViewCrossAxisCount
              ? Colors.black12
              : Colors.transparent,
          width: 1.5,
        ),
      ),
    );
  }
}
