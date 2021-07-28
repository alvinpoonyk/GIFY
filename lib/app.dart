import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gify/routing/get_pages.dart';

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GIFY',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      getPages: getPages,
    );
  }
}