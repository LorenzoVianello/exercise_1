import 'package:exercise_1/controllers/items.controller.dart';
import 'package:exercise_1/views/item/item.page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsListPage extends GetResponsiveView<ItemsController> {
  final String tag;

  ItemsListPage({super.key, required this.tag});

  Widget phone() {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Items"),
        centerTitle: true,
      ),
      body: Obx(
        () => controller.fetching.value
            ? Center(
                child: CircularProgressIndicator(
                color: Color.fromRGBO(21, 68, 150, 1),
              ))
            : ListView(children: controller.items.map(getItemWidget).toList()),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: controller.logout,
        icon: Icon(
          Icons.logout,
          color: Color.fromRGBO(21, 68, 150, 1),
        ),
        label: Text("Logout"),
      ),
    );
  }

  Widget getItemWidget(Item item) {
    return InkWell(
      onTap: () {
        Get.to(
          () => ItemPage(
            item: item,
          ),
        );
      },
      child: Card(
        child: Hero(
          tag: item.id,
          child: Image.network(
            item.img,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) =>
                Icon(Icons.no_photography),
          ),
        ),
      ),
    );
  }
}
