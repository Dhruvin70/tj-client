import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tjclient/config/config.dart';
import 'package:tjclient/config/routesUrl.dart';

Future<bool> logoutUser () async {
  final Map<String,String> headers = {
    'X-API-Key': ApiConfig.apiKey, // Access the API key from the config file
    'X-API-Id': ApiConfig.apiId, // Access the API ID from the config file
    'Content-Type': 'application/json',
  };
  final response = await http.get(Uri.parse(ApiUrls().LOGOUT),headers: headers);

  if (response.statusCode == 200){
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
    return true;
  }
  else{
    debugPrint('${response.statusCode}');
    debugPrint('${response.body}');
    return false;
  }
}