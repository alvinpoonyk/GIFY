import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:gify/controllers/auth_controller.dart';

class LoginSignUpPageController extends GetxController {

  var isInvalidEmailOrPassword = false.obs;

  final AuthController _authController = Get.find();
  final String _errorTitle = "Authentication Failed";

  Future<void> loginUser({required String email, required String password}) async {
    try {
      await _authController.loginUser(email: email, password: password);
      print("LoginSignUpPageController(loginUser): Logged in user successfully");
      Map<String, String> params = {"id" : _authController.getCurrentUserID()};
      Get.toNamed("/profile/", parameters: params);
    } catch(e) {
      print("LoginSignUpPageController(loginUser): ${e.toString()}");
      Get.defaultDialog(title: _errorTitle, middleText: "Invalid email or password", contentPadding: const EdgeInsets.all(10), titlePadding: const EdgeInsets.all(10));
    }
  }

}