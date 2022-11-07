import 'package:flutter_application_1/data/network/BaseApiServices.dart';
import 'package:flutter_application_1/data/network/NetworkApiServices.dart';
import 'package:flutter_application_1/res/components/app_url.dart';

class AuthRepository {
  BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostResponseApi(AppUrl.loginEndUrl, data);
      return response;
    } catch (e) {
      // throw e;
    }
  }

  Future<dynamic> registerApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostResponseApi(AppUrl.registerApiEndUrl, data);
      return response;
    } catch (e) {
      // throw e;
    }
  }
}
