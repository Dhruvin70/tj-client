import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInApi{
  // Creates the Google Sign in object
  static final _googleSignIn = GoogleSignIn();

  //Returns the Google sign in account
  static Future<GoogleSignInAccount?> login() => _googleSignIn.signIn();
  static Future logout() => _googleSignIn.disconnect();

}