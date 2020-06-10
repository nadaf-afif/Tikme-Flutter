import 'package:dartz/dartz_unsafe.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiClient {
  String baseUrl;
  SharedPreferences sharedPreferences;

  ApiClient({@required this.sharedPreferences, @required this.baseUrl});

  Future<http.Response> postRequestHandle(
      String url,
      Map<String, dynamic> bodyParams,
      Map<dynamic, dynamic> headerParams) async {
    print("$baseUrl$url \n $bodyParams \n $headerParams");

    if (bodyParams.isNotEmpty && headerParams.isNotEmpty) {
      return http.post("$baseUrl$url", body: bodyParams, headers: headerParams);
    } else if (headerParams.isEmpty) {
      return http.post("$baseUrl$url", body: bodyParams);
    }
  }

  Future<http.Response> getRequestHandle(String endPoint,
      Map<String, dynamic> queryMap, Map<dynamic, dynamic> headerParams) async {
    String queryParams = "";

    queryMap.forEach((key, value) {
      queryParams += "$key=$value&";
    });

    print("$baseUrl$endPoint \n $queryParams \n $headerParams");

    final url = "$baseUrl$endPoint?$queryParams";

    if (headerParams.isNotEmpty) {
      return http.get(url, headers: headerParams);
    } else if (headerParams.isEmpty) {
      return http.get(url);
    }
  }
}
