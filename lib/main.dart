import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tjclient/pages/checkout.dart';
import 'package:tjclient/pages/forgotPassword.dart';
import 'package:tjclient/pages/home.dart';
import 'package:tjclient/pages/login.dart';
import 'package:tjclient/pages/passwordSetter.dart';
import 'package:tjclient/pages/productDescription.dart';
import 'package:tjclient/pages/registration.dart';
import 'package:tjclient/pages/splashScreen.dart';
import 'package:tjclient/widgets/fireBaseOptions.dart';
import 'package:tjclient/widgets/transaction.dart';

import 'controllers/pageController.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  if (Firebase.apps.isEmpty) {
    await Firebase.initializeApp(options: firebaseOptions);
  }

  runApp(MyApp(jwtToken: sharedPreferences.getString('jwtToken')));
}

class MyApp extends StatelessWidget {
  final String? jwtToken;

  const MyApp({Key? key, required this.jwtToken}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isFirstTimeUser = jwtToken == null;
    bool isTokenValid = jwtToken != null && !JwtDecoder.isExpired(jwtToken!);

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => const Home(),
        '/login': (context) => const Login(),
        '/register': (context) => const RegistrationPage(),
        '/product-description': (context) => const ProductDescriptionPage(),
        '/profile': (context) => const ProfilePage(),
        '/checkout-paypal': (context) => const PaypalPayment(),
        '/password-reset': (context)=> const Password(),
        '/password-reset-otp': (context) => ForgotPasswordPage(),
        '/splash' : (context)=> Splash(isFirstTimeUser: isFirstTimeUser, isTokenValid: isTokenValid)
      },
      initialRoute: "/splash",
    );
  }
}
