import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:projet_last/constace.dart';
import 'package:get/get.dart';
import 'package:projet_last/core/view_model/control_view_model.dart';
import 'package:projet_last/core/view_model/profile_view_model.dart';
import 'package:projet_last/view/adresse_view.dart';
import 'package:projet_last/view/auth/login_view.dart';
import 'package:projet_last/view/checkout/add_address_widget.dart';
import 'package:projet_last/view/notification.dart';
import 'package:projet_last/view/widgets/custom_text.dart';

class ProfileView extends GetView<ControlViewModel> {
  const ProfileView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(
      init: ProfileViewModel(),
      builder: (controller) => controller.loading.value
          ? Center(
              child: CircularProgressIndicator(
              color: primaryColor2,
            ))
          : Scaffold(
              body: Container(
              padding: EdgeInsets.only(top: 50),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 130,
                            width: 130,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.all(
                                Radius.circular(100),
                              ),
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image:
                                      // controller.userModel
                                      //== null
                                      //?
                                      AssetImage('assets/images/pic.png')
                                  //: controller.userModel.pic == 'default'
                                  //  ? AssetImage('assets/images/pic.png')
                                  //: NetworkImage(
                                  //  controller.userModel.pic)
                                  ),
                            ),
                            // child: FlatButton(
                            //   child: Text('sign out'),
                            //   onPressed: () {
                            //     // controller.signOut();
                            //     // Get.offAll(LoginView());
                            //     // print(controller.userModel.name);
                            //   },
                            // ),
                          ),
                          Column(
                            children: [
                              CustomText(
                                text: controller.userModel?.name == null
                                    ? 'User'
                                    : controller.userModel.name,
                                color: Colors.black,
                                fontSize: 26,
                              ),
                              CustomText(
                                text: controller.userModel?.email == null
                                    ? 'User'
                                    : controller.userModel.email,
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    Container(
                      child: FlatButton(
                        onPressed: () {
                          Get.to(AdresseView());
                        },
                        child: ListTile(
                            title: CustomText(
                              text: 'Edit Profile',
                            ),
                            leading: Image.asset(
                                'assets/menu_icon/Icon_Edit-Profile.png'),
                            trailing: Icon(
                              Icons.navigate_next,
                              color: Colors.black,
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Container(
                      child: FlatButton(
                        onPressed: () {},
                        child: ListTile(
                            title: CustomText(
                              text: 'Adresse de livraison ',
                            ),
                            leading: Image.asset(
                                'assets/menu_icon/Icon_Location.png'),
                            trailing: Icon(
                              Icons.navigate_next,
                              color: Colors.black,
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Container(
                      child: FlatButton(
                        onPressed: () {},
                        child: ListTile(
                            title: CustomText(
                              text: 'Historique des commandes',
                            ),
                            leading: Image.asset(
                                'assets/menu_icon/Icon_History.png'),
                            trailing: Icon(
                              Icons.navigate_next,
                              color: Colors.black,
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Container(
                      child: FlatButton(
                        onPressed: () {},
                        child: ListTile(
                            title: CustomText(
                              text: 'Cartes',
                            ),
                            leading: Image.asset(
                                'assets/menu_icon/Icon_Payment.png'),
                            trailing: Icon(
                              Icons.navigate_next,
                              color: Colors.black,
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Container(
                      child: FlatButton(
                        onPressed: () {
                          Get.to(NotificationView());
                        },
                        child: ListTile(
                            title: CustomText(
                              text: 'Notifications',
                            ),
                            leading:
                                Image.asset('assets/menu_icon/Icon_Alert.png'),
                            trailing: Icon(
                              Icons.navigate_next,
                              color: Colors.black,
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Container(
                      child: FlatButton(
                        onPressed: () {
                          controller.signOut();
                          Get.offAll(LoginView());
                        },
                        child: ListTile(
                            title: CustomText(
                              text: 'Se déconnecter',
                            ),
                            leading:
                                Image.asset('assets/menu_icon/Icon_Exit.png'),
                            trailing: Icon(
                              Icons.navigate_next,
                              color: Colors.black,
                            )),
                      ),
                    )
                  ],
                ),
              ),
            )),
    );
  }
}
