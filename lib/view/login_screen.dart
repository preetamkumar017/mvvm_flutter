import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/utils/routes/routes_name.dart';
import 'package:flutter_application_1/utils/utils.dart';
import 'package:flutter_application_1/view/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: InkWell(
        onTap: (() {
          // Utils.toastMessage("no internet connection");
          // Utils.snackBar("no internet Connection", context);
          Utils.flushBarErrorMessage("no internet Connection", context);
          // Navigator.pushNamed(context, RoutesName.home);
          // print("object");
          // Navigator.push(context,MaterialPageRoute(builder: (context) => HomeScreen(),));
        }),
        child: Text(
          "Click",
          style: TextStyle(fontSize: 50.0),
        ),
      ),
    ));
  }
}
