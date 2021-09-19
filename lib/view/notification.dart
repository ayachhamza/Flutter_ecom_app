import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projet_last/constace.dart';
import 'package:projet_last/core/view_model/control_view_model.dart';
import 'package:projet_last/core/view_model/home_view_model.dart';
import 'package:projet_last/view/widgets/custom_text.dart';

import 'details_view.dart';

class NotificationView extends StatelessWidget {
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
          title: Text(
            'Notification center',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: listViewProducts());
  }

  Widget listViewProducts() {
    return Container(
      //height: 350,
      child: ListView.separated(
        itemCount: images.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                //Get.to(DetailsScreen());
              },
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Container(
                  width: double.infinity,
                  height: 220,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage(images[index]),
                          fit: BoxFit.fitWidth)),
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
                          onTap: () {},
                          child: Container(
                            height: 50,
                            margin: EdgeInsets.symmetric(horizontal: 40),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            child: Center(
                                child: Text(
                              titles[index],
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
              ));
        },
        separatorBuilder: (context, index) => SizedBox(
          width: 20,
        ),
      ),
    );
  }
}

final images = [
  'assets/images/trac.jpg',
  'assets/images/jcb.png',
  'assets/images/waiter.png',
];

final titles = [
  'Delivery',
  'Address',
  'Summer',
];
