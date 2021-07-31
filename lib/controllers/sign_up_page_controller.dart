import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:gify/controllers/auth_controller.dart';
import 'package:gify/models/image_file.dart';
import 'package:gify/repositories/users_repository.dart';
import 'package:gify/repositories/users_repository_impl.dart';
import 'package:gify/services/get_selected_image_bytes.dart';
import 'package:gify/widgets/center_circular_progress_indicator.dart';
import 'package:gify/widgets/getX_widgets/getX_error_snack_bar.dart';

class SignUpPageController extends GetxController {

  var userImage = ImageFile(null, null).obs;

  final AuthController _authController = Get.find();
  final UsersRepository _usersRepository = UsersRepositoryImpl();
  final errorTitle = 'Oops, something went wrong...';

  final TextEditingController displayNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  void onClose() {
    displayNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }


  Future<void> setUserImage() async {
    try {
      ImageFile selectedImage = await getSelectedImageFile();
      userImage.value = selectedImage;
      userImage.refresh();
    } catch (e) {
      _showErrorSnackBar(errorTitle: errorTitle, errorMessage: e.toString());
    }

  }


  Future<void> createAndSignInUser({required String displayName, required String email, required String password}) async  {
    try {
      Map<String, dynamic> userData = {
        "displayName" : displayName,
        "email" : email,
      };

      Future<void> signUpUserProcess() async {
        await _authController.signUpUser(email: email, password: password);
        await _usersRepository.createUser(userData: userData, imageFile: userImage.value);
        await _authController.updateUser(email: email);
      }

      await Get.showOverlay(
        asyncFunction: signUpUserProcess,
        loadingWidget: centerCircularProgressIndicator(),
      );

      Get.defaultDialog(title: "SUCCESS!");
      print("SignUpPageController(createAndSignInUser): Successfully complete sign up process");
      Map<String, String> params = {"id" : _authController.getCurrentUserID()};
      Get.offAllNamed("/profile/", parameters: params);
    } catch(e) {
      print("SignUpPageController(createAndSignInUser): ${e.toString()}");
      _showErrorSnackBar(errorTitle: errorTitle, errorMessage: e.toString());
    }
  }

  /// Helper method to display error snack bar
  void _showErrorSnackBar({required String errorTitle, required String errorMessage}) {
    getXErrorSnackBar(title: errorTitle, message: errorMessage);
  }

}