import 'package:flutter_application_1/data/app_exceptions.dart';
import 'package:flutter_application_1/data/network/BaseApiServices.dart';
import 'package:flutter_application_1/data/network/NetworkApiServices.dart';
import 'package:flutter_application_1/model/photos_model.dart';
import 'package:flutter_application_1/res/components/app_url.dart';

class PhotosRepository {
  BaseApiServices _apiServices = NetworkApiServices();

  Future<PhotosModel> photosApi() async {
    try {
      dynamic response =
          await _apiServices.getGetResponseApi(AppUrl.photosListEndPoint);
      return response = PhotosModel.fromJson(response);
    } catch (e) {
      throw NoDataException(e.toString());
    }
  }
}
