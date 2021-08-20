import 'dart:ffi';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:projet_last/constace.dart';
import 'package:projet_last/core/view_model/home_view_model.dart';
import 'package:projet_last/view/cart_view.dart';
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
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 100, left: 20, right: 20),
        child: Column(
          children: [
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

  Widget _listViewCategory() {
    return Container(
      height: 100,
      child: ListView.separated(
        itemCount: names.length,
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
                  child: Image.asset('assets/images/engine.png'),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CustomText(text: names[index])
            ],
          );
        },
        separatorBuilder: (context, index) => SizedBox(
          width: 20,
        ),
      ),
    );
  }

  Widget _listViewProducts() {
    return Container(
      height: 350,
      child: ListView.separated(
        itemCount: names.length,
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
                    child: Image.asset(
                      'assets/images/jcb.png',
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                CustomText(
                  align: Alignment.bottomLeft,
                  fontSize: 18,
                  text: 'JCB 3CX',
                ),
                SizedBox(
                  height: 10,
                ),
                CustomText(
                  text: 'Catégorie',
                  align: Alignment.bottomLeft,
                  fontSize: 12,
                  color: Colors.grey.shade600,
                ),
                SizedBox(
                  height: 10,
                ),
                CustomText(
                  text: '\$5000',
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
    );
  }
}
