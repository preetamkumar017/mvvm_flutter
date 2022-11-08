import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/routes/routes_name.dart';
import 'package:flutter_application_1/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final userPreference = Provider.of<UserViewModel>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text("Homepage"),
          centerTitle: true,
        ),
        body: Center(
          child: InkWell(
            onTap: () {
              userPreference.remove().then((value) {
                print(value);
                Navigator.pushReplacementNamed(context, RoutesName.login);
              });
            },
            child: Text(
              "Logout",
              style: TextStyle(fontSize: 30),
            ),
          ),
        ));
  }
}
