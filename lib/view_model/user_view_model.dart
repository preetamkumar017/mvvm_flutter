import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/model/user_model.dart';
import 'package:flutter_application_1/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel with ChangeNotifier {
  Future<bool> saveUser(UserModel user) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString("token", user.token.toString());
    Utils.toastMessage(user.token.toString());
    notifyListeners();
    return true;
  }

  Future<UserModel> getUser() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? token = sp.getString("token");
    print(token);

    return UserModel(
      token: token,
    );
  }

  Future<bool> remove() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove("token");
    return true;
  }
}