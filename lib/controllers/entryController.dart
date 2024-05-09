import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field_v2/otp_field_v2.dart';
import 'package:tjclient/model/user/user.dart';
import 'package:tjclient/operations/apiRegisterUser.dart';
import 'package:tjclient/operations/sentOtpEmail.dart';

class RegistrationController extends GetxController {

  TextEditingController regfullName = TextEditingController();
  TextEditingController regemail = TextEditingController();
  String regphone = "";
  TextEditingController regpassword = TextEditingController();
  OtpFieldControllerV2 otpController = OtpFieldControllerV2();
  bool otpFieltText = false;
  int? otpSent;
  int? otpEntered;

  addUser(BuildContext context) async {
    try {
      if (regfullName.text.isEmpty ||
          regphone.trim().isEmpty ||
          regpassword.text.isEmpty ||
          regemail.text.isEmpty) {
        Get.snackbar('ERROR', "ONE OR MORE FIELD EMPTY", colorText: Colors.red);
        return;
      }
      if (otpSent == otpEntered) {
        User user =
            User(regfullName.text, regphone, regpassword.text, regemail.text,null);
        final userJson = user.toJson();

        if (await sendData(userJson)) {
          Get.snackbar('SUCCESS', "REGISTERED SUCCESSFULLY",
              colorText: Colors.green);
          Navigator.pushNamed(context, '/login');
          regfullName.clear();
          regemail.clear();
          regpassword.clear();
          regphone = "";
          otpController.clear();
          otpFieltText = false;

        } else
          Get.snackbar('ERROR', "DATA NOT SENT", colorText: Colors.red);
      } else
        Get.snackbar('ERROR', "OTP IS INCORRECT", colorText: Colors.red);
    } on Exception {
      Get.snackbar('ERROR', "ERROR WHILE REGISTERING", colorText: Colors.red);

      // TODO
    }
  }

  otpGen() async {
    try {
      if (regfullName.text.isEmpty ||
          regphone.trim().isEmpty ||
          regpassword.text.isEmpty ||
          regemail.text.isEmpty) {
        Get.snackbar('ERROR', "ONE OR MORE FIELD EMPTY", colorText: Colors.red);
        return;
      }
      final random = Random();
      int otp = 10000 + random.nextInt(90000);
      print(regphone);

      print(otp);
      if (otp != null) {
        sendOtpEmail(regemail.text, otp.toString());

        otpSent = otp;
        otpFieltText = true;
        Get.snackbar('SUCCESS', "OTP SENT IF EMAIL EXISTS",
            colorText: Colors.green);
      } else
        Get.snackbar('ERROR', "ERROR WHILE SENDING OTP", colorText: Colors.red);
    } catch (e) {
      print(e);
    } finally {
      update();
    }
  }
}
