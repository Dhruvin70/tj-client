import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tjclient/controllers/googleController.dart';
import 'package:tjclient/operations/apilogout.dart';

import '../operations/google_sign_in.dart';

class Logout extends GetxController {

  logout(BuildContext context) async {
    await logoutUser();
    if (await logoutUser()) {
      Navigator.pushNamed(context, '/login');
    }
  }
  Future logoutGoogle(BuildContext context) async {
    await GoogleSignInApi.logout();

    Navigator.pushNamed(context, '/login');
  }
}

