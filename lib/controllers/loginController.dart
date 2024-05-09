

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tjclient/operations/apilogin.dart';

class LoginController extends GetxController {
  TextEditingController loginpassword = TextEditingController();
  TextEditingController loginemail = TextEditingController();

  loginUser(BuildContext context) async {
    try {
      if (loginemail.text
          .trim()
          .isEmpty || loginpassword.text
          .trim()
          .isEmpty) {
        Get.snackbar('ERROR', "ONE OR MORE FIELD EMPTY",
            icon: Icon(Icons.error, color: Colors.red),
            colorText: Colors.red,
            backgroundColor: Colors.white);
        return;
      } else {
        final Map<String, dynamic> loginJson = {
          'email': loginemail.text,
          'password': this.loginpassword.text
        };

        // Response from api
        if ((await loginData(context, loginJson))) {
          loginemail.clear();
          loginpassword.clear();
          Navigator.pushNamed(context, '/');
        } else {
          Get.snackbar('ERROR', "CREDENTIAL INVALID",
              icon: Icon(Icons.error, color: Colors.red),
              colorText: Colors.red,
              backgroundColor: Colors.white);

          loginemail.clear();
          loginpassword.clear();
          return;
        }
      }
    } on Exception catch (e) {
      print(e);
    } finally {
      update();
    }
  }


}

