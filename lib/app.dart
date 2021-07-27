import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gify/controllers/auth_controller.dart';
import 'package:gify/pages/explore_page.dart';
import 'package:gify/pages/item_detail_page.dart';
import 'package:gify/pages/login_signup_page.dart';
import 'package:gify/pages/profile_page.dart';

final AuthController _authController = Get.find();

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GIFY',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => ExplorePage()),
        GetPage(name: '/login', page: () => LoginSignUpPage()),
        GetPage(name: '/item', page: () => ItemDetailPage()),
        GetPage(name: '/profile', page: () {
          if (_authController.isUserLoggedIn())
            return ProfilePage();
          return LoginSignUpPage();
        }),
      ],
    );
  }
}