import 'package:exercise_1/controllers/items.controller.dart';
import 'package:exercise_1/controllers/login.controller.dart';
import 'package:exercise_1/views/login/login.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

void main() {
  //Controllers registration with unique key, but shared between both controllers to recycle same key across views

  String tag = UniqueKey().toString();

  Get.put<LoginController>(LoginController(tag: tag), tag: tag);
  Get.put<ItemsController>(ItemsController(tag: tag), tag: tag);

  //Set orientation to vertical only
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  //Run app wrapped in Sizer builder to allow sizer utils use
  runApp(
    Sizer(
      builder: (context, orientation, deviceType) {
        //Run Getx application
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          //ThemeModes selection
          theme: ThemeData.light(useMaterial3: true),
          themeMode: ThemeMode.light,
          //Entry widget
          home: LoginPage(tag: tag),
        );
      },
    ),
  );
}
