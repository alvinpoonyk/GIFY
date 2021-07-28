import 'package:get/get.dart';
import 'package:gify/controllers/auth_controller.dart';
import 'package:gify/pages/add_item_page.dart';
import 'package:gify/pages/explore_page.dart';
import 'package:gify/pages/item_detail_page.dart';
import 'package:gify/pages/login_signup_page.dart';
import 'package:gify/pages/profile_page.dart';
import 'package:gify/pages/sign_up_page.dart';

final AuthController _authController = Get.find();

final List<GetPage> getPages = [
  GetPage(name: '/', page: () => ExplorePage()),
  GetPage(name: '/login', page: () {
    if (_authController.isUserLoggedIn())
      return ProfilePage();
    return LoginSignUpPage();
  }),
  GetPage(name: '/sign-up', page: () {
    if (_authController.isUserLoggedIn())
      return ProfilePage();
    return SignUpPage();
  }),
  GetPage(name: '/item', page: () => ItemDetailPage()),
  GetPage(name: '/add-item', page: () {
    if (_authController.isUserLoggedIn())
      return AddItemPage();
    return LoginSignUpPage();
  }),
  GetPage(name: '/profile', page: () {
    if (_authController.isUserLoggedIn())
      return ProfilePage();
    return LoginSignUpPage();
  }),
];