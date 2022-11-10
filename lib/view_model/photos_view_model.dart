import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/data/response/api_responce.dart';
import 'package:flutter_application_1/model/photos_model.dart';
import 'package:flutter_application_1/repository/photos_repositry.dart';
import 'package:flutter_application_1/utils/routes/routes_name.dart';

class PhotosViewModel extends ChangeNotifier {
  final _myRepo = PhotosRepository();
  ApiResponse<PhotosModel> photos = ApiResponse.loading();

  setLoading(ApiResponse<PhotosModel> response) {
    photos = response;
    notifyListeners();
  }

  Future<void> fetchphotosApi(BuildContext context) async {
    setLoading(ApiResponse.loading());
    _myRepo.photosApi().then((value) {
      setLoading(ApiResponse.complited(value));
      print(value.toString());
    }).onError((error, stackTrace) {
      setLoading(ApiResponse.error(error.toString()));
      print(error.toString());
    });
  }
}
