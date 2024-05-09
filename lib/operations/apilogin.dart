import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tjclient/config/config.dart';
import 'package:http/http.dart' as http;
import 'package:tjclient/config/routesUrl.dart';
import 'package:tjclient/operations/apilogout.dart';


Future<bool> loginData(BuildContext context,Map<String,dynamic> userLoginJson) async {
 final Map<String,String> headers = {
   'X-API-Key': ApiConfig.apiKey, // Access the API key from the config file
   'X-API-Id': ApiConfig.apiId, // Access the API ID from the config file
   'Content-Type': 'application/json',
  };
   
 final response =await http.post(
   Uri.parse(ApiUrls().LOGIN),
   headers: headers,
   body: jsonEncode(userLoginJson)
 );

 if (response.statusCode == 200){
    var loginRespArr = jsonDecode(response.body);
    var jwtToken = loginRespArr['jwtToken'] ;
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('jwtToken', jwtToken);
    print(jwtToken);
    // Navigator.pushNamed(context, '/',arguments: {
    //   'jwtToken':jwtToken
    // });
    return true;

 }
 else{
   debugPrint('Nothing');

   debugPrint('${response.statusCode}');
   debugPrint('${response.body}');
  return false;
 }
}

Future<bool> loginDataOauth(BuildContext context,Map<String,dynamic> userLoginJson) async {
  final Map<String,String> headers = {
    'X-API-Key': ApiConfig.apiKey, // Access the API key from the config file
    'X-API-Id': ApiConfig.apiId, // Access the API ID from the config file
    'Content-Type': 'application/json',
  };

  final response =await http.post(
      Uri.parse(ApiUrls().LOGINOAUTH),
      headers: headers,
      body: jsonEncode(userLoginJson)
  );

  if (response.statusCode == 200){
    var loginRespArr = jsonDecode(response.body);
    var jwtToken = loginRespArr['jwtToken'] ;
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('jwtToken', jwtToken);
    debugPrint('${response.statusCode}');
    debugPrint('${response.body}');
    print(jwtToken);

    return true;

  }
  else{

    return false;
  }



}