import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../config/config.dart';
import '../config/routesUrl.dart';

Future<bool> resettingData(BuildContext context,String email ,String password) async {
  final Map<String,String> headers = {
    'X-API-Key': ApiConfig.apiKey, // Access the API key from the config file
    'X-API-Id': ApiConfig.apiId, // Access the API ID from the config file
    'Content-Type': 'application/json',
  };

  final response =await http.post(
      Uri.parse(ApiUrls().RESET_PASSWORD),
      headers: headers,
      body: json.encode({
        'email':email,
        'password':password
      })
  );

  if (response.statusCode == 200){

    return true;

  }
  else{
    debugPrint('Nothing');

    debugPrint('${response.statusCode}');
    debugPrint('${response.body}');
    return false;
  }
}
