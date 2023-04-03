import 'package:exercise_1/controllers/items.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ItemPage extends GetResponsiveView {
  final Item item;

  ItemPage({required this.item});

  Widget phone() {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.title),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Card(
            child: Hero(
              tag: item.id,
              child: Image.network(
                item.img,
                fit: BoxFit.cover,
              ),
            ),
          ),
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
          SizedBox(
            width: 90.w,
            child: Text(item.description),
          ),
        ],
      ),
    );
  }
}
