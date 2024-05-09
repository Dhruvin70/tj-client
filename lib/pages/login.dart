import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tjclient/controllers/googleController.dart';
import 'package:tjclient/controllers/loginController.dart';


class Login extends StatelessWidget {

  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.put(LoginController());
    final GoogleSignInController googleSignInController = Get.put(GoogleSignInController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 330,
              color: Colors.white,
              // Adjust the height of the container as needed
              child: Stack(
                alignment: Alignment.topLeft,
                children: <Widget>[
                  const Positioned(
                    top: -20,
                    left: 0,
                    right: 0,
                    child: Image(
                      image: AssetImage("assets/Picture3.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    right: 50,
                    child: Row(children: [
                      Text("T",
                          style: GoogleFonts.sourceSerif4(
                              fontSize: 100,
                              color: Colors.white,
                              shadows: [
                                const Shadow(
                                  color: Colors.black, // Shadow color
                                  blurRadius: 10, // Blur radius
                                  offset: Offset(4, 2), // Shadow offset
                                )
                              ])),
                      Container(
                        padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                        child: Text(
                          "j",
                          style: GoogleFonts.sourceSerif4(
                              fontSize: 100, color: Colors.white, shadows: [
                            const Shadow(
                              color: Colors.black, // Shadow color
                              blurRadius: 10, // Blur radius
                              offset: Offset(4, 2), // Shadow offset
                            )
                          ]),
                        ),
                      )
                    ]),
                  ),
                  const Positioned(
                    top: 0,
                    left: -230,
                    right: 100,
                    child: Image(
                      image: AssetImage("assets/pendelpng.png"),
                      // Adjust the height of the image as needed
                      height: 230,
                    ),
                  ),
                  const Positioned(
                    top: 180,
                    left: 100,
                    right: -100,
                    child: Image(
                      image: AssetImage("assets/bracelate.png"),
                      height: 180, // Adjust the height of the image as needed
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height - 330,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  Positioned(

                    left: -100,
                    bottom: -30,
                    child: Image(
                      image: AssetImage("assets/necklace.png"),
                      height: 380,
                    ),
                  ),
                  Positioned(
                    right: -230,
                    bottom: 0,
                    child: Image(
                      image: AssetImage("assets/ring.png"),
                      height: 270,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(

                    ),
                    padding: EdgeInsets.fromLTRB(20, 0, 5, 20),
                    child: GetBuilder<GoogleSignInController>(builder: (logic) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Sign in",
                                    style: GoogleFonts.openSans(
                                      color: Colors.black,
                                      fontSize: 28,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    "Welcome to TJ",
                                    style: GoogleFonts.openSans(
                                      color: Colors.black45,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),

                              Container(
                                padding: EdgeInsets.fromLTRB(0, 0, 25, 0),
                                child: Row(
                                  children: [
                                    // IconButton(
                                    //   icon: Icon(
                                    //     Icons.facebook_rounded,
                                    //     color: Colors.blueAccent,
                                    //     size: 50,
                                    //   ),splashColor: Colors.transparent,
                                    //   highlightColor: Colors.transparent,
                                    //   onPressed: () {
                                    //     print("faceboook");
                                    //   },
                                    // ),
                                    SizedBox(width: 10),
                                    GestureDetector(
                                        onTap: () {
                                        logic.signIn(context);
                                      },
                                      child: Image(
                                        image: AssetImage("assets/google.png"),
                                        width: 40,
                                       ),
                                    )
                                  ],
                                ),
                              )

                            ],
                          ),
                          SizedBox(height: 5),
                          GetBuilder<LoginController>(builder: (ctrl) {
                            return Column(
                              children: [
                                TextField(
                                  style: GoogleFonts.openSans(
                                    fontSize: 15,
                                    color: Colors.black,
                                  ),
                                  controller: ctrl.loginemail,
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
                                    contentPadding: EdgeInsets.fromLTRB(
                                        25, 10, 0, 10),
                                  ),
                                ),
                                SizedBox(height: 10),
                                TextField(
                                  style: GoogleFonts.openSans(
                                    fontSize: 15,
                                    color: Colors.black,
                                  ),
                                  controller: ctrl.loginpassword,
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
                                    contentPadding: EdgeInsets.fromLTRB(
                                        25, 10, 0, 10),
                                  ),
                                ),
                              ],
                            );
                          }),
                          SizedBox(height: 5),
                          Container(
                            padding: EdgeInsets.fromLTRB(5, 0, 25, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GetBuilder<LoginController>(builder: (ctrl) {
                                  return ElevatedButton(
                                    onPressed: () {
                                      ctrl.loginUser(context);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.orange.shade700,
                                      foregroundColor: Colors.white,
                                    ),
                                    child: Text("Sign in"),
                                  );
                                }),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context, '/password-reset-otp');
                                  },
                                  child: Text(
                                    "Forgot Password ?",
                                    style: GoogleFonts.openSans(
                                      color: Colors.black45,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    }),
                  ),
                  Positioned(
                    bottom: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: GoogleFonts.openSans(
                            color: Colors.black54,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(width: 5),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/register');
                          },
                          child: Text(
                            "Sign up",
                            style: GoogleFonts.openSans(
                              color: Colors.orange.shade700,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
