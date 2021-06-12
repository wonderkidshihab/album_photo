import 'package:albumapp/Core/AppRoutes.dart';
import 'package:albumapp/Data/Local/DB/DB.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  await DB.instance.initializeDB();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Album Photos",
      getPages: AppRoutes.routes,
      initialRoute: AppRoutes.INITIAL,
      debugShowCheckedModeBanner: false,
    );
  }
}
