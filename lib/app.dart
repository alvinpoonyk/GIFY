import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:gify/pages/add_item_page.dart';
import 'package:gify/pages/explore_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GIFY',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AddItemPage(),
    );
  }
}