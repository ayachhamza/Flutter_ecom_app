import 'package:flutter/material.dart';
import 'package:projet_last/constace.dart';
import 'package:projet_last/helper/enum.dart';
import 'package:projet_last/view/widgets/custom_text.dart';

class DeliveryTime extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Delivery delivery = Delivery.LivraisonStandard;
    return Expanded(
      child: Column(
        children: [
          SizedBox(
            height: 80,
          ),
          RadioListTile<Delivery>(
            value: null,
            groupValue: null,
            onChanged: (Delivery value) {},
            title: CustomText(
              text: 'Livraison Standard',
              fontSize: 24,
            ),
            subtitle: CustomText(
              text: '\n La Commande va arriver dans 3 - 5 Jour',
              fontSize: 15,
            ),
            activeColor: primaryColor2,
          ),
          SizedBox(
            height: 40,
          ),
          RadioListTile<Delivery>(
            value: delivery,
            groupValue: null,
            onChanged: (Delivery value) {},
            title: CustomText(
              text: 'Livraison Demain',
              fontSize: 24,
            ),
            subtitle: CustomText(
              text: '\n La Commande va arriver dans 7 - 9 Jour',
              fontSize: 15,
            ),
            activeColor: primaryColor2,
          ),
          SizedBox(
            height: 40,
          ),
          RadioListTile<Delivery>(
            value: delivery,
            groupValue: null,
            onChanged: (Delivery value) {},
            title: CustomText(
              text: 'Livraison customizer',
              fontSize: 24,
            ),
            subtitle: CustomText(
              text: '\n La Commande va arriver dans ? - 15 Jour',
              fontSize: 15,
            ),
            activeColor: primaryColor2,
          ),
          SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
