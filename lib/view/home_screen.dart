import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/response/status.dart';
import 'package:flutter_application_1/utils/routes/routes_name.dart';
import 'package:flutter_application_1/view_model/photos_view_model.dart';
import 'package:flutter_application_1/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PhotosViewModel photosViewModel = PhotosViewModel();

  @override
  void initState() {
    photosViewModel.fetchphotosApi(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userPreference = Provider.of<UserViewModel>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text("Homepage"),
          centerTitle: true,
          actions: [
            Center(
              child: InkWell(
                onTap: () {
                  userPreference.remove().then((value) {
                    print(value);
                    Navigator.pushReplacementNamed(context, RoutesName.login);
                  });
                },
                child: Text(
                  "Logout",
                ),
              ),
            )
          ],
        ),
        body: ChangeNotifierProvider<PhotosViewModel>(
          create: (BuildContext context) => photosViewModel,
          child: Consumer<PhotosViewModel>(
            builder: (context, value, _) {
              switch (value.photos.status) {
                case Status.LOADING:
                  return CircularProgressIndicator();
                case Status.ERROR:
                  return Text(value.photos.message.toString());
                case Status.COMPLITED:
                  return Text("kdsk");
              }

              return Container();
            },
          ),
        ));
  }
}
