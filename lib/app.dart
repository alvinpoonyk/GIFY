import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gify/pages/explore_page.dart';
import 'package:gify/routing/get_pages.dart';

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GIFY',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      initialRoute: '/',
      // home: ExplorePage(),
      getPages: getPages,
    );
  }
}