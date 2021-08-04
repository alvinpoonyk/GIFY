import 'package:get/get.dart';
import 'package:gify/controllers/auth_controller.dart';
import 'package:gify/pages/add_item_page.dart';
import 'package:gify/pages/conversations_page.dart';
import 'package:gify/pages/edit_item_page.dart';
import 'package:gify/pages/explore_page.dart';
import 'package:gify/pages/item_detail_page.dart';
import 'package:gify/pages/login_signup_page.dart';
import 'package:gify/pages/messages_page.dart';
import 'package:gify/pages/profile_page.dart';
import 'package:gify/pages/sign_up_page.dart';

// final AuthController _authController = Get.find();

final List<GetPage> getPages = [
  GetPage(name: '/explore', page: () => ExplorePage()),
  GetPage(name: '/login', page: () {
    // if (_authController.isUserLoggedIn())
    //   return ProfilePage();
    return LoginSignUpPage();
  }),
  GetPage(name: '/sign-up', page: () {
    // if (_authController.isUserLoggedIn())
    //   return ProfilePage();
    return SignUpPage();
  }),
  GetPage(name: '/item', page: () => ItemDetailPage()),
  GetPage(name: '/add-item', page: () {
    // if (_authController.isUserLoggedIn())
      return AddItemPage();
    // return LoginSignUpPage();
  }),
  GetPage(name: '/profile', page: () {
    // if (_authController.isUserLoggedIn())
      return ProfilePage();
    // return LoginSignUpPage();
  }),
  GetPage(name: '/conversations', page: () {
    // if (_authController.isUserLoggedIn())
       return ConversationsPage();
    // return LoginSignUpPage();
  }),
  GetPage(name: '/messages', page: () {
    // if (_authController.isUserLoggedIn())
      return MessagesPage();
    // return LoginSignUpPage();
  }),
  GetPage(name: '/edit-item', page: () {
    // if (_authController.isUserLoggedIn())
      return EditItemPage();
    // return LoginSignUpPage();
  }),
];