import 'dart:ffi';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:projet_last/constace.dart';
import 'package:projet_last/core/view_model/control_view_model.dart';
import 'package:projet_last/core/view_model/home_view_model.dart';
import 'package:projet_last/view/cart_view.dart';
import 'package:projet_last/view/control_view.dart';
import 'package:projet_last/view/widgets/custom_button.dart';
import 'package:projet_last/view/widgets/custom_text.dart';

class HomeView extends StatelessWidget {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final List<String> names = <String>[
    'Engine',
    '1',
    '1',
    '1',
    '1',
    '1',
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => controller.loading.value
          ? Center(
              child: CircularProgressIndicator(
              color: primaryColor,
            ))
          : Scaffold(
              body: Container(
                padding: EdgeInsets.only(top: 100, left: 20, right: 20),
                child: Column(
                  children: [
                    // SizedBox(
                    //   height: 15,
                    //   child: CustomButton(
                    //     text: 'Sign out',
                    //     onPress: () {
                    //       FirebaseAuth.instance.signOut();
                    //     },
                    //     color: Colors.black,
                    //   ),
                    // ),

                    _searchTextField(),
                    SizedBox(
                      height: 30,
                    ),
                    CustomText(
                      text: 'Catégory',
                      weight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    _listViewCategory(),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: 'Meilleure vente',
                          weight: FontWeight.bold,
                          fontSize: 18,
                        ),
                        CustomText(
                          text: 'Voir tout',
                          fontSize: 16,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    _listViewProducts(),
                  ],
                ),
              ),
            ),
    );
  }

  Widget _searchTextField() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey.shade200,
      ),
      child: TextFormField(
          decoration: InputDecoration(
        border: InputBorder.none,
        prefixIcon: Icon(
          Icons.search,
          color: Colors.black,
        ),
      )),
    );
  }

//  Widget _listViewCategory() {
//     return GetBuilder<HomeViewModel>(
//       builder: (controller) => Container(
//         height: 100,
//         child: ListView.separated(
//           itemCount: controller.categoryModel.length,
//           scrollDirection: Axis.horizontal,
//           itemBuilder: (context, index) {
//             return Column(
//               children: [
//                 Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(50),
//                     color: Colors.grey.shade100,
//                   ),
//                   height: 60,
//                   width: 60,
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Image.network(controller.categoryModel[index].image),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 CustomText(
//                   text: controller.categoryModel[index].name,
//                 ),
//               ],
//             );
//           },
//           separatorBuilder: (context, index) => SizedBox(
//             width: 20,
//           ),
//         ),
//       ),
//     );
//   }

  Widget _listViewCategory() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => Container(
        height: 120,
        child: ListView.separated(
          itemCount: controller.categoryModel.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey.shade100),
                  height: 60,
                  width: 60,
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:
                          Image.network(controller.categoryModel[index].image)),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      width: 80,
                      child: CustomText(
                        align: Alignment.center,
                        text: controller.categoryModel[index].name,
                      ),
                    ),
                  ],
                )
              ],
            );
          },
          separatorBuilder: (context, index) => SizedBox(
            width: 20,
          ),
        ),
      ),
    );
  }

  Widget _listViewProducts() {
    return GetBuilder<HomeViewModel>(
        builder: (controller) => Container(
              height: 350,
              child: ListView.separated(
                itemCount: controller.productModel.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(color: Colors.white),
                          child: Container(
                              height: 220,
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: Image.network(
                                  controller.productModel[index].image)),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        CustomText(
                          align: Alignment.bottomLeft,
                          fontSize: 18,
                          text: controller.productModel[index].name,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: CustomText(
                            text: controller.productModel[index].description,
                            align: Alignment.bottomLeft,
                            fontSize: 12,
                            color: Colors.grey.shade600,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomText(
                          text: controller.productModel[index].price + ' DH',
                          align: Alignment.bottomLeft,
                          fontSize: 16,
                          color: primaryColor2,
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(
                  width: 20,
                ),
              ),
            ));
  }
}
