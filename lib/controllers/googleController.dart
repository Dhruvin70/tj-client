import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tjclient/model/user/user.dart';
import 'package:tjclient/operations/apiRegisterUser.dart';
import 'package:tjclient/operations/google_sign_in.dart';

import '../operations/apilogin.dart';

class GoogleSignInController extends GetxController {

  bool googleSignIn = false;

  String generateRandomPassword({int length = 10}) {
    const charset =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#%^&*()-_=+';
    final random = Random();
    return List.generate(
        length, (index) => charset[random.nextInt(charset.length)]).join();
  }

  Future signIn(BuildContext context) async {
    String? name;
    String email;
    String password;
    String phoneNumber;
    String gid;
    final user = await GoogleSignInApi.login();

    print(user);

    if (user == null) {
      Get.snackbar('ERROR', "SIGN IN FAILED", colorText: Colors.red);
    } else {
      final exists = await userExists(user.email);
      if (exists == 'false') {
        name = user.displayName;
        email = user.email;
        password = generateRandomPassword();
        phoneNumber = "+12444123456";
        gid = (user.id) ;

        User appuser = User(name! ?? email, phoneNumber, password, email, gid);
        final userJson = appuser.toJson();
        sendData(userJson);
      }
    }

    try {
      final Map<String, dynamic> loginJson = {
        'email': user?.email,
      };

      // Response from api
      if ((await loginDataOauth(context, loginJson))) {
        googleSignIn = true;
        Navigator.pushNamed(context, '/');
      }
    } catch (e) {
      print(e);
    } finally {
      update();
    }
  }
}

