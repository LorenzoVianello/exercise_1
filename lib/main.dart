import 'package:exercise_1/controllers/items.controller.dart';
import 'package:exercise_1/controllers/login.controller.dart';
import 'package:exercise_1/views/login/login.page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

void main() {
  String tag = UniqueKey().toString();

  Get.put<LoginController>(LoginController(tag: tag), tag: tag);
  Get.put<ItemsController>(ItemsController(tag: tag), tag: tag);

  runApp(
    Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(useMaterial3: true),
          themeMode: ThemeMode.light,
          home: LoginPage(tag: tag),
        );
      },
    ),
  );
}
