import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:tjclient/controllers/entryController.dart';
import 'package:tjclient/pages/login.dart';
import 'package:tjclient/widgets/otp.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final RegistrationController registrationController = Get.put(RegistrationController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Sign up',
          style: GoogleFonts.openSans(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.deepOrange.shade400,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Registration',
                style: GoogleFonts.openSans(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Join us on an exciting journey by creating your account',
                style: GoogleFonts.openSans(
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                  color: Colors.black45,
                ),
              ),
              const SizedBox(height: 25),

              GetBuilder<RegistrationController>(builder: (ctrl) {

                return Column(
                  children: [
                    TextField(
                      controller: ctrl.regemail,
                      style: GoogleFonts.openSans(
                        fontSize: 15,
                        color: Colors.black,
                      ),
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
                        contentPadding: const EdgeInsets.fromLTRB(25, 10, 0, 10),
                      ),
                    ),
                    const SizedBox(height: 25),
                    TextField(
                      controller: ctrl.regfullName,
                      style: GoogleFonts.openSans(
                        fontSize: 15,
                        color: Colors.black,
                      ),
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
                        labelText: 'Full Name',
                        contentPadding: const EdgeInsets.fromLTRB(25, 10, 0, 10),
                      ),
                    ),
                    const SizedBox(height: 25),
                    IntlPhoneField(

                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelText: 'Phone Number',
                        contentPadding: const EdgeInsets.fromLTRB(25, 10, 0, 10),
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
                      ),
                      initialCountryCode: 'US',
                      onChanged: (phone) {
                        ctrl.regphone = phone.completeNumber;
                      },
                    ),
                    TextField(
                      controller: ctrl.regpassword,
                      style: GoogleFonts.openSans(
                        fontSize: 15,
                        color: Colors.black,
                      ),
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
                        labelText: 'Password',
                        contentPadding: const EdgeInsets.fromLTRB(25, 10, 0, 10),
                      ),
                    ),
                    const SizedBox(height: 15),
                    OtpTextField(
                      otpController: ctrl.otpController,
                      visible: ctrl.otpFieltText,
                      onComplete: (otp) {
                        ctrl.otpEntered = int.parse(otp);
                      },),
                    const SizedBox(height: 15),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (ctrl.otpFieltText) {
                            ctrl.addUser(context);
                          } else
                            ctrl.otpGen();
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          backgroundColor: Colors.orange.shade700,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(64),
                          ),
                        ),
                        child: Text(ctrl.otpFieltText ? 'Sign Up' : "Send OTP",
                          style: GoogleFonts.openSans(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                  ],
                );
              }),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: GoogleFonts.openSans(
                      color: Colors.black54,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/login');
                    },
                    child: Text(
                      "Sign in",
                      style: GoogleFonts.openSans(
                        color: Colors.orange.shade700,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              Container(

                child: const Positioned(
                    bottom: 0,
                    child: Image(
                      image: AssetImage("assets/diamongring.png"),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
