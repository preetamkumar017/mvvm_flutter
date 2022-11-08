import 'package:flutter/material.dart';
import 'package:flutter_application_1/view_model/services/splash_services.dart';
import 'package:flutter_application_1/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  SplashServices splashServices = SplashServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashServices.checkAuthentication(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Text(
      "Splash Screen",
      style: TextStyle(fontSize: 50),
    )));
  }
}
