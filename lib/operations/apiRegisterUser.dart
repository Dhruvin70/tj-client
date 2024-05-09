import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:tjclient/config/routesUrl.dart';

import 'package:http/http.dart' as http;
import 'package:tjclient/config/config.dart';

Future<bool> sendData(Map<String,dynamic> userJson) async {


  final Map<String, String> headers = {
    'X-API-Key': ApiConfig.apiKey, // Access the API key from the config file
    'X-API-Id': ApiConfig.apiId, // Access the API ID from the config file
    'Content-Type': 'application/json',
  };
  final response = await http.post(
    Uri.parse(ApiUrls().SEND_DATA),
    headers: headers,
    body: jsonEncode(userJson),
  );
  debugPrint('${response.statusCode}');
  debugPrint('${response.body}');
  if (response.statusCode == 201) {
    return true;
  }
  return false;
}

Future<String> userExists(String email) async {


  final Map<String, String> headers = {
    'X-API-Key': ApiConfig.apiKey, // Access the API key from the config file
    'X-API-Id': ApiConfig.apiId, // Access the API ID from the config file
    'Content-Type': 'application/json',
  };
  final response = await http.get(
    Uri.parse('http://192.168.2.25:8051/api/users/exists/${email}'),
    headers: headers
  );
  debugPrint('http://192.168.2.25:8051/api/users/exists/${email}');
  debugPrint('${response.statusCode}');
  debugPrint('${response.body}');

  return response.body;
}