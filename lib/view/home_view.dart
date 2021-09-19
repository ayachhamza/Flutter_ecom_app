import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:projet_last/constace.dart';

import 'package:projet_last/core/view_model/home_view_model.dart';
import 'package:projet_last/core/view_model/profile_view_model.dart';
import 'package:projet_last/helper/extenstion.dart';
import 'package:projet_last/view/allProducts_view.dart';
import 'package:projet_last/view/category_products_view.dart';
import 'package:projet_last/view/details_view.dart';
import 'package:projet_last/view/notification.dart';
import 'package:projet_last/view/profile_view.dart';
import 'package:projet_last/view/test_view.dart';
import 'package:projet_last/view/widgets/custom_button.dart';

import 'package:projet_last/view/widgets/custom_text.dart';

import '../globals.dart';

class HomeView extends StatelessWidget {
// FirebaseAuth _auth = FirebaseAuth.instance;

// final List<String> names = <String>[
//   'Engine',
//   '1',
//   '1',
//   '1',
//   '1',
//   '1',
// ];
  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: Get.find(),
      builder: (controller) => controller.loading.value
          ? Center(
              child: CircularProgressIndicator(
              color: primaryColor,
            ))
          : Scaffold(
              appBar: AppBar(
                elevation: 0,
                leading: Padding(
                  padding: const EdgeInsets.only(left: 32, top: 6, bottom: 4),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(ProfileView());
                    },
                    child: Container(
                      // height: 10,
                      // width: 10,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(100),
                        ),
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image:
                                // _auth.currentUser.photoURL == null
                                //     ?
                                AssetImage('assets/images/pic.png')
                            // : _auth.currentUser.photoURL == 'default'
                            //     ? AssetImage('assets/images/pic.png')
                            //     : NetworkImage(_auth.currentUser.photoURL)
                            ),
                      ),
                    ),
                  ),
                ),
                leadingWidth: 80,
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: IconButton(
                      icon: Icon(
                        Icons.notifications,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        Get.to(NotificationView());
                      },
                    ),
                  )
                ],
                title: Padding(
                  padding: const EdgeInsets.only(left: 60, top: 10),
                  child: CustomText(
                    text:
                        //_auth.currentUser.displayName.toString() != null
//                        ?
                        'Hi ,Hamza Ayach',
                    //                       : 'Bonjour, ' +
                    // _auth.currentUser.displayName.toString(),
                    color: Colors.black,
                    weight: FontWeight.w500,
                    fontSize: 20,
                    align: Alignment.topLeft,
                  ),
                ),
                backgroundColor: Colors.grey.shade50,
              ),
              //backgroundColor: Colors.white,
              body: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Column(
                    children: [
                      _searchTextFormField(),
                      SizedBox(
                        height: 30,
                      ),
                      CustomText(
                        text: "Catégories",
                        weight: FontWeight.bold,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      _listViewCategory(),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: "Meilleur vents",
                            fontSize: 18,
                            weight: FontWeight.bold,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(AllProductsView());
                            },
                            child: CustomText(
                              text: "Voir tous",
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      _listViewProducts(),
                      SizedBox(
                        height: 30,
                      ),
                      // Container(
                      //   decoration: BoxDecoration(
                      //     color: Colors.amber,
                      //     borderRadius: BorderRadius.circular(15),
                      //     // image: DecorationImage(
                      //     //   fit: BoxFit.fill,
                      //     // ),
                      //     // alignment: Alignment.topCenter,
                      //   ),
                      //   height: 100,
                      //   width: MediaQuery.of(context).size.width,
                      //   child: CustomText(
                      //     align: Alignment.center,
                      //     color: Colors.white,
                      //     text: 'Ads',
                      //   ),
                      // ),
                      adsBanner(),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: "Notre sélection",
                            fontSize: 18,
                            weight: FontWeight.bold,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(AllProductsView());
                            },
                            child: CustomText(
                              text: "Voir tous",
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),

                      Container(
                        //height: 400,
                        child: productGridView(),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      // adsBanner()
                      Container(
                        width: double.infinity,
                        height: 220,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: HexColor.fromHex('#FD6A21')),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            // gradient: LinearGradient(
                            //     begin: Alignment.bottomRight,
                            //     colors: [
                            //       Colors.black.withOpacity(.4),
                            //       Colors.black.withOpacity(.2),
                            //     ])),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                "Nouveux",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.to(AllProductsView());
                                },
                                child: Container(
                                  height: 50,
                                  margin: EdgeInsets.symmetric(horizontal: 40),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white),
                                  child: Center(
                                      child: Text(
                                    "Achetez maintenant",
                                    style: TextStyle(
                                        color: Colors.grey[900],
                                        fontWeight: FontWeight.bold),
                                  )),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  Widget _searchTextFormField() {
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
        ),
      ),
    );
  }

  Widget _listViewCategory() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => Container(
        height: 100,
        child: ListView.separated(
          itemCount: controller.categoryModel.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                //print(controller.categoryModel[index].id.toString());
                globalInt = controller.categoryModel[index].id;
                // print(globalInt.toString());
                Get.to(TestView(
                  model: controller.categoryModel[index],
                ));
                //print(controller.productModel2.length);
              },
              child: Container(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.grey.shade100,
                      ),
                      height: 60,
                      width: 60,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.network(
                            controller.categoryModel[index].image),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomText(
                      text: controller.categoryModel[index].name,
                    ),
                  ],
                ),
              ),
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
            return GestureDetector(
              onTap: () {
                Get.to(DetailsScreen(
                  model: controller.productModel[index],
                ));
              },
              child: Container(
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
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                      child: Container(
                          height: 220,
                          color: Colors.white,
                          width: MediaQuery.of(context).size.width * .4,
                          child: Image.network(
                            controller.productModel[index].image,
                            fit: BoxFit.fitWidth,
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
          separatorBuilder: (context, index) => SizedBox(
            width: 20,
          ),
        ),
      ),
    );
  }

  Widget productGridView() {
    return GetBuilder<HomeViewModel>(
      init: Get.find(),
      builder: (controller) => Container(
        padding: EdgeInsets.all(7),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 300,
              childAspectRatio: 1,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            primary: false,
            itemCount: 4,
            itemBuilder: (BuildContext ctx, index) {
              return GestureDetector(
                  onTap: () {
                    Get.to(DetailsScreen(
                      model: controller.productModel[index],
                    ));
                  },
                  child: Container(
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: NetworkImage(
                                controller.productModel[index].image),
                            fit: BoxFit.fitHeight)),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                              begin: Alignment.bottomRight,
                              colors: [
                                Colors.black.withOpacity(.4),
                                Colors.black.withOpacity(.2),
                              ])),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            height: 26,
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(horizontal: 50),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey.shade50),
                            child: Center(
                                child: CustomText(
                              text: controller.productModel[index].price,
                              align: Alignment.center,
                              fontSize: 15,
                              weight: FontWeight.bold,
                            )),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            controller.productModel[index].name,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          )
                        ],
                      ),
                    ),
                  ));
            }),
      ),
    );
  }

  Widget adsBanner() {
    return Container(
      width: double.infinity,
      height: 220,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
              image: AssetImage('assets/images/trac.jpg'),
              fit: BoxFit.fitWidth)),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
              Colors.black.withOpacity(.4),
              Colors.black.withOpacity(.2),
            ])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(
              "Nouveux",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                Get.to(AllProductsView());
              },
              child: Container(
                height: 50,
                margin: EdgeInsets.symmetric(horizontal: 40),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: Center(
                    child: Text(
                  "Achetez maintenant",
                  style: TextStyle(
                      color: Colors.grey[900], fontWeight: FontWeight.bold),
                )),
              ),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
