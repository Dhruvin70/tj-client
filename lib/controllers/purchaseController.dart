import 'package:flutter/material.dart';
import 'package:flutter_paypal/flutter_paypal.dart';
import 'package:flutter_paypal_checkout/flutter_paypal_checkout.dart';
import 'package:get/get.dart';

class PurchaseController extends GetxController {
  TextEditingController address = TextEditingController();
  double price = 0;
  String name = "";
  String orderAddress = "";
  String email = "";
  String description = "";

  void submitOrder({
    required double price,
    required String name,
    required String description,
  }) {
    this.price = price;
    this.name = name;
    this.description = description;
    orderAddress = address.text;
    print("$price $name $orderAddress");
  }

  void initiatePayPalCheckout(BuildContext context, {
    required double price,
    required String name,
    required String description,
  }) {
    this.price = price;
    this.name = name;
    orderAddress = address.text;
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) =>  UsePaypal(
        sandboxMode: true,
        clientId :"AaK58vnH67kZ9D-cyv1Tm-53FoFEMR908UMPepEX6iZ-l7y7G6pgzN7JJsTZEz_AdB3NG-wk0i9ss3Ho",
      secretKey :"EBzvAhV4chdwefBHb3f4-pVq-qNi05rL6aLZMyGl2SzCzH2wIjJ9kM9qqq34Bwt7yhA6s4p7YZiLqugd",
        returnURL: "success.tj.com",
        cancelURL: "cancel.tj.com",
        transactions:  [
          {
            "amount": {
              "total": "${price}",
              "currency": "USD",
              "details": {
                "subtotal": '${price}',
                "shipping": '0',
                "shipping_discount": 0
              }
            },
            "description": "The payment transaction description.",
            "item_list": {
              "items": [
                {
                  "name":"${name}",
                  "quantity": 1,
                  "price": "${price}",
                  "currency": "USD"
                },
              ],
            }
          }
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map<String, dynamic> params) async {
          print("onSuccess: $params");
        },
        onError: (dynamic error) {
          print("onError: $error");
          Navigator.pop(context);
        },
        onCancel: () {
          print('cancelled:');
        },
      ),
    ));
  }
}
