import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intro_slider/dot_animation_enum.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:intro_slider/scrollbar_behavior_enum.dart';
import 'package:projet_last/view/control_view.dart';

class IntroScreen extends StatefulWidget {
  IntroScreen({Key key}) : super(key: key);

  @override
  IntroScreenState createState() => new IntroScreenState();
}

// ------------------ Custom config ------------------

class IntroScreenState extends State<IntroScreen> {
  List<Slide> slides = [];

  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
        title: "SONTAREX",
        description:
            "façon moderne d'acheter des machines et des pièces industrielles",
        pathImage: "assets/images/sontarex.png",
        heightImage: 400,
        widthImage: 400,
        backgroundColor: Color.fromRGBO(57, 62, 70, 1.0),
      ),
    );
    slides.add(
      new Slide(
        title: "Commander",
        description:
            "commandez de n'importe où au maroc et soyez sûr que vous recevrez votre commande à votre porte ",
        pathImage: "assets/images/ship1.png",
        backgroundColor: Color(0xfff5a623),
      ),
    );

    slides.add(
      new Slide(
        title: "Livraison",
        description:
            "votre commande sera expédiée à votre porte dès que possible et c'est garanti",
        pathImage: "assets/images/shop.png",
        backgroundColor: Color(0xff9932CC),
      ),
    );
  }

  void onDonePress() {
    // Do what you want
    Get.to(ControlView());
  }

  @override
  Widget build(BuildContext context) {
    return new IntroSlider(
      slides: this.slides,
      onDonePress: this.onDonePress,
    );
  }
}
