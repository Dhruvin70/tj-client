import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tjclient/controllers/pageController.dart';
import 'package:tjclient/pages/home.dart';

class NavigationBottom extends StatelessWidget {
  const NavigationBottom({super.key});

  @override
  Widget build(BuildContext context) {
    final controller  = Get.put(NavigationController());
   return CurvedNavigationBar(items:  [Icon(Icons.home), Icon(Icons.person)],
        onTap: (index){
            Navigator.pushNamed(context, controller.screen[index]);
        },
        height: 60,
          color: Colors.blue,
          backgroundColor: Colors.transparent,
          buttonBackgroundColor: Colors.orange,
          animationDuration: Duration(milliseconds: 300),
        );
  }
}

class NavigationController extends GetxController{
  final Rx<int> selected = 0.obs;
  final screen = ["/","/profile"];
}