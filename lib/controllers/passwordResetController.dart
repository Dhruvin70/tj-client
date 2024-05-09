import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field_v2/otp_field_v2.dart';
import 'package:tjclient/operations/apiRegisterUser.dart';
import 'package:tjclient/operations/apiresetpass.dart';

import '../operations/sentOtpEmail.dart';

class ResetPasswordController extends GetxController {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController repassword = TextEditingController();
  OtpFieldControllerV2 otpController = OtpFieldControllerV2();
  bool? otpFieltTextpass = false;
  int? otpSent;
  int? otpEntered;

  checkingOtp(BuildContext context) {
    if (otpEntered == otpSent) {
      Navigator.pushNamed(context, '/password-reset');
    } else {
      Get.snackbar('ERROR', "INVALID OTP",
          icon: Icon(Icons.error, color: Colors.red),
          colorText: Colors.red,
          backgroundColor: Colors.white);
    }
    return;
  }

  resettingPassword(BuildContext context) async {
    if (password.text.isEmpty || repassword.text.isEmpty) {
    return  Get.snackbar('ERROR', "ONE OR MORE FIELD EMPTY",
          icon: Icon(Icons.error, color: Colors.red),
          colorText: Colors.red,
          backgroundColor: Colors.white);
    }
    if (password.text != repassword.text) {
      Get.snackbar('ERROR', "PASSWORD DON'T MATCH",
          icon: Icon(Icons.error, color: Colors.red),
          colorText: Colors.red,
          backgroundColor: Colors.white);
    } else {
      if (await resettingData(context, email.text.toString(), password.text.toString())) {
        Get.snackbar('NOTE', "PASSWORD RESET SUCCESSFULLY",
            icon: Icon(Icons.done_all, color: Colors.green),
            colorText: Colors.green,
            backgroundColor: Colors.white);
       return Navigator.pushNamed(context,'/login');
      } else {
        Get.snackbar('ERROR', "BAD REQUEST",
            icon: Icon(Icons.error, color: Colors.red),
            colorText: Colors.red,
            backgroundColor: Colors.white);
      }
    }
  }

  otpGenForgot() async {
    try {
      if (email.text.isEmpty) {
        Get.snackbar('ERROR', "ONE FIELD EMPTY", colorText: Colors.red);
        return;
      }
      final random = Random();
      int otp = 10000 + random.nextInt(90000);
      print(otp);

      sendOtpEmail(email.text, otp.toString());

      otpSent = otp;
      otpFieltTextpass = true;
      Get.snackbar('SUCCESS', "OTP SENT IF EMAIL EXISTS",
          colorText: Colors.green);
    } catch (e) {
      print(e);
    } finally {
      update();
    }
  }
}
