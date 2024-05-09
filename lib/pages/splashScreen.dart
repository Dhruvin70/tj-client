import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class Splash extends StatelessWidget {
  final bool isFirstTimeUser;
  final bool isTokenValid;
  const Splash({super.key, required this.isFirstTimeUser, required this.isTokenValid});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      if (isFirstTimeUser || !isTokenValid) {

        Navigator.pushNamed(context,'/login');
      } else {
        Navigator.pushNamed(context, '/');
      }
    });
    return Scaffold(

      body: Center(
        child: Container(

          decoration:  const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.deepOrange,Colors.white, Colors.green],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          const Image(
          image: AssetImage("assets/TJlogo.png"),
          ),
              Text("TANVI JEWELLERS",style: GoogleFonts.openSans(fontSize:30,fontWeight:FontWeight.w700,color:Colors.indigo.shade700),),
              Text("\"Destination for all kinds of Jewels\"",style: GoogleFonts.openSans(fontSize:15,fontWeight:FontWeight.w700,color:Colors.brown.shade400),)

            ],
          ),
        ),
      ),
    );
  }
}
