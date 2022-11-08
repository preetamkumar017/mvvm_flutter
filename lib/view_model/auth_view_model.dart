import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/model/user_model.dart';
import 'package:flutter_application_1/repository/auth_repository.dart';
import 'package:flutter_application_1/utils/routes/routes_name.dart';
import 'package:flutter_application_1/utils/utils.dart';
import 'package:flutter_application_1/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();
  bool _loading = false;
  bool _signuploading = false;

  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  bool get signuploading => _signuploading;

  setSignupLoading(bool value) {
    _signuploading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepo.loginApi(data).then((value) {
      setLoading(false);
      final userPreference = Provider.of<UserViewModel>(context, listen: false);
      print(value.toString());
      userPreference.saveUser(UserModel(token: value['token'].toString()));
      Navigator.pushReplacementNamed(context, RoutesName.home);
    }).onError((error, stackTrace) {
      setLoading(false);
      print(error.toString());
      Utils.flushBarErrorMessage(error.toString(), context);
    });
  }

  Future<void> signupApi(dynamic data, BuildContext context) async {
    setSignupLoading(true);
    _myRepo.registerApi(data).then((value) {
      setSignupLoading(false);
      print(value.toString());
    }).onError((error, stackTrace) {
      setSignupLoading(false);
      print(error.toString());
      Utils.flushBarErrorMessage(error.toString(), context);
    });
  }
}
