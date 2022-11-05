import 'dart:convert';
import 'dart:io';

import 'package:flutter_application_1/data/app_exceptions.dart';
import 'package:flutter_application_1/data/network/BaseApiServices.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices {
  dynamic responseJson;
  @override
  Future getGetResponseApi(String url) async {
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection available");
    }

    return responseJson;
  }

  @override
  Future getPostResponseApi(String url, dynamic data) async {
    try {
      final response = await http
          .post(Uri.parse(url), body: data)
          .timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection available");
    }

    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(
            "Error accourd while communicating with server: " +
                response.statusCode.toString());

      case 404:
        throw UnauthorisedException(
            "Error accourd while communicating with server: " +
                response.statusCode.toString());

      case 500:
        throw InvalidInputException(
            "Error accourd while communicating with server: " +
                response.statusCode.toString());

      default:
        throw FetchDataException(
            "Error accourd while communicating with server: " +
                response.statusCode.toString());
    }
  }
}
