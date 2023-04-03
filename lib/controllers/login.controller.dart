import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:exercise_1/views/list/list.page.dart';
import 'package:exercise_1/views/login/login.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final String tag;

  RxString token = "".obs;

  RxBool logged = false.obs, logging_in = false.obs;

  //Controllers for user for data in FE
  TextEditingController user_username = TextEditingController(text: ""),
      user_password = TextEditingController(text: "");

  LoginController({required this.tag});

//Login Function
  void login() async {
    //Try to login if inputs fields are populated
    if (areFieldsPopulated()) {
      logging_in.value = true;
      //Token retrieve
      await Dio()
          .getUri(Uri.parse("https://flutter.dyndns.org/auth.json"))
          .then((result) {
        if (result.statusCode == 200) {
          //Save login data, clear input fields and render ItemListPage
          dynamic json = jsonDecode(jsonEncode(result.data));
          token.value = json["toekn"] as String;
          logged.value = true;
          resetLoginData();
          Get.to(
              () => ItemsListPage(
                    tag: tag,
                  ),
              transition: Transition.leftToRight);
        }
      }, onError: (e) {
        Get.log(e.toString());
      });
      logging_in.value = false;
    }
  }

  //Return true if fields are populated
  bool areFieldsPopulated() {
    if (user_username.text.isEmpty) {
      spawnSnackbar(message: "Nessun nome utente fornito!");
      return false;
    }
    if (user_password.text.isEmpty) {
      spawnSnackbar(message: "Nessuna password fornita!");
      return false;
    }
    return true;
  }

  //Spawn error snackbar with custom message
  void spawnSnackbar({required String message}) {
    Get.closeAllSnackbars();
    Get.snackbar("Errore nel login!", message,
        icon: Icon(Icons.error), duration: 3.seconds, isDismissible: true);
  }

//Clear token, set logout and navigate user to LoginPage
  void logout() {
    token.value = "";
    logged.value = false;
    Get.to(() => LoginPage(tag: tag), transition: Transition.rightToLeft);
  }

//Clear all input fields
  void resetLoginData() {
    user_username.text = "";
    user_password.text = "";
  }
}
