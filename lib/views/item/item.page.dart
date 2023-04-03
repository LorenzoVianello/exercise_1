import 'package:exercise_1/controllers/items.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ItemPage extends GetResponsiveView {
  final Item item;

  ItemPage({required this.item});

  //Return Item ItemPage
  Widget phone() {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.title),
        centerTitle: true,
      ),
      body: Column(
        children: [
          //Show Item's image wrapped in Hero tag to allow animation from previous page
          Card(
            child: Hero(
              tag: item.id,
              child: Image.network(
                item.img,
                fit: BoxFit.cover,
              ),
            ),
          ),
          //Spawn 90% width widget to show Item's title
          SizedBox(
            width: 90.w,
            child: Text(
              item.title,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: "Roboto",
                fontSize: 18.sp,
                color: Color.fromRGBO(21, 68, 150, 1),
              ),
            ),
          ),
          Divider(),
          //Spawn 90% width widget to show Item's description
          SizedBox(
            width: 90.w,
            child: Text(item.description),
          ),
        ],
      ),
    );
  }
}
