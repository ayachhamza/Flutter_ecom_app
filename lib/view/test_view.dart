import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projet_last/constace.dart';
import 'package:projet_last/core/view_model/home_view_model.dart';
import 'package:projet_last/model/category_model.dart';
import 'package:projet_last/model/product_model.dart';
import 'package:projet_last/view/control_view.dart';
import 'package:projet_last/view/widgets/custom_text.dart';

import 'details_view.dart';

class TestView extends StatelessWidget {
  CategoryModel model;

  int gridViewCrossAxisCount = 3;

  TestView({this.model});
  //List<ProductModel> _DataList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          title: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    height: 30, width: 30, child: Image.network(model.image)),
                SizedBox(
                  width: 2,
                ),
                Text(
                  model.name,
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
        ),
        body: productGridView());
  }

  Widget productGridView() {
    return GetBuilder<HomeViewModel>(
      init: Get.find(),
      builder: (controller) => Container(
        padding: EdgeInsets.all(10),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 300,
              childAspectRatio: 3 / 5,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: controller.productModel.length,
            itemBuilder: (BuildContext ctx, index) {
              var data = controller.productModel[index];
              bool visible = data.categoryId != model.id;
              // _DataList = controller.productModel
              //     .where((i) =>
              //         controller.productModel[index].categoryId ==
              //         model.id)
              //     .toList();
              // _DataList.removeWhere(
              //     (element) => element.categoryId != model.id);

              // if (data.categoryId != model.id) {
              //   controller.productModel.removeAt(index);
              // }

              return
                  //  visible
                  //     ? Padding(
                  //         padding: const EdgeInsets.all(5),
                  //         child: Container(color: Colors.grey.shade50),
                  //       )
                  //     :

                  GestureDetector(
                onTap: () {
                  Get.to(DetailsScreen(
                    model: data,
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
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                          ),
                          height: 200,
                          width: 200,
                          child: Image.network(data.image),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: CustomText(
                            align: Alignment.center,
                            text: data.name,
                            fontSize: 15,
                            weight: FontWeight.w100,
                          ),
                        ),
                        SizedBox(
                          height: 1,
                        ),
                        Expanded(
                          child: CustomText(
                            text: data.description,
                            color: Colors.grey,
                            align: Alignment.bottomLeft,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CustomText(
                          text: data.price.toString() + " \DH",
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
    );
  }
}
