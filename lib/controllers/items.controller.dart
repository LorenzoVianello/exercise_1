import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:exercise_1/controllers/login.controller.dart';
import 'package:get/get.dart';

//Item class
class Item {
  int id;
  String img;
  String title;
  String description;

  Item({
    required this.id,
    required this.img,
    required this.title,
    required this.description,
  });
}

//Items controller
class ItemsController extends GetxController {
  final String tag;

  final LoginController login;

  //Items list
  RxList<Item> items = <Item>[].obs;

  RxBool fetching = false.obs;

  ///  class constructor
  ///
  ///  It first find LoginController instance and keep it in a final variable
  ///
  ///  It then listen to LoginController's logged field as a stream
  ///
  ItemsController({required this.tag})
      : login = Get.find<LoginController>(tag: tag) {
    //Listen for .logged changes
    login.logged.listen((logged) {
      if (logged) {
        //Fetch data if logged = true
        fetchData();
      }
    });
  }

  //Getter for token
  RxString get token => login.token;

  //Logout shorthand
  void logout() => login.logout();

//Fetch json data to populate items
  void fetchData() async {
    fetching.value = true;
    await Dio()
        .getUri(Uri.parse("https://flutter.dyndns.org/data.json"))
        .then((result) {
      if (result.statusCode == 200) {
        //json encoding
        dynamic json = jsonDecode(jsonEncode(result.data));

        //Assign all jsons parsed items to items
        //Convert json.items to a list, then maps through it and transform each dynamc element to Item element
        items.assignAll(
            ((json["items"] ?? []) as List<dynamic>).map((item) => Item(
                  id: item["id"] as int,
                  img: "https://flutter.dyndns.org${(item["image"] as String)}",
                  title: item["title"] as String,
                  description: item["description"] as String,
                )));
      }
    });
    fetching.value = false;
  }
}
