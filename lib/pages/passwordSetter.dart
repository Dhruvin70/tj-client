import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tjclient/controllers/passwordResetController.dart';

class Password extends StatelessWidget {
  const Password({super.key});

  @override
  Widget build(BuildContext context) {
    ResetPasswordController resetPasswordController = Get.put(ResetPasswordController());

    return GetBuilder<ResetPasswordController>(builder: (ctrl) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Password Reset", style: GoogleFonts.openSans()),
          backgroundColor: Colors.orange.shade700,
          elevation: 5,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Enter New Password To Reset",
              style: GoogleFonts.openSans(fontSize: 25),
              textAlign: TextAlign.center,),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: Column(
                children: [
                  TextField(
                    style: GoogleFonts.openSans(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                    controller: ctrl.password,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.orange.shade800,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(64),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.orange.shade800,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(64),
                      ),
                      labelText: 'New Password',
                      contentPadding: EdgeInsets.fromLTRB(
                          25, 10, 0, 10),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    style: GoogleFonts.openSans(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                    controller: ctrl.repassword,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.orange.shade800,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(64),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.orange.shade800,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(64),
                      ),
                      labelText: 'Re-New Password',
                      contentPadding: EdgeInsets.fromLTRB(
                          25, 10, 0, 10),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            MaterialButton(onPressed: () {ctrl.resettingPassword(context);},
              color: Colors.orange.shade700,
              elevation: 5,
              padding: const EdgeInsets.fromLTRB(35, 15, 35, 15),
              child: Text("Reset Password",
                  style: GoogleFonts.openSans(fontSize: 15, color: Colors
                      .white)),)
          ],
        ),
      );
    });
  }
}
