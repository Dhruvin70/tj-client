import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/instance_manager.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/passwordResetController.dart';
import '../widgets/otp.dart';


class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({Key? key});


  @override
  Widget build(BuildContext context) {
    ResetPasswordController resetPasswordController = Get.put(ResetPasswordController());

    return GetBuilder<ResetPasswordController>(builder: (ctrl) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange.shade700,
          elevation: 5,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Enter Your Email To reset your password",
              style: GoogleFonts.openSans(fontSize: 25),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                style: GoogleFonts.openSans(
                  fontSize: 15,
                  color: Colors.black,
                ),
                controller: ctrl.email,
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
                  labelText: 'Email',
                  contentPadding: EdgeInsets.fromLTRB(25, 10, 0, 10),
                ),
              ),
            ),
            const SizedBox(height: 15),
            OtpTextField(
              otpController: ctrl.otpController,
              visible: ctrl.otpFieltTextpass ?? false, // Provide a default value if null
              onComplete: (otp) {
                ctrl.otpEntered = int.parse(otp);
              },
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: 355,
              child: ElevatedButton(
                onPressed: () {
                  if (ctrl.otpFieltTextpass ?? false) { // Provide a default value if null
                    ctrl.checkingOtp(context);
                  } else {
                    ctrl.otpGenForgot();
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  backgroundColor: Colors.orange.shade700,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(64),
                  ),
                ),
                child: Text(
                  ctrl.otpFieltTextpass ?? false ? 'Submit OTP' : "Send OTP", // Provide a default value if null
                  style: GoogleFonts.openSans(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}

