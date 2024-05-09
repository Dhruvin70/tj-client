import 'package:flutter/material.dart';
import 'package:tjclient/pages/navigatorBottom.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: Colors.green),
        child: Icon(
          Icons.person,
          size: 70,
        ),
      ),
      bottomNavigationBar: const NavigationBottom(),
    );
  }
}
