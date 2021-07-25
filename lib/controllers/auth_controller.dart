import 'package:get/get.dart';
import 'package:gify/models/user.dart';
import 'package:gify/repositories/auth_repository.dart';
import 'package:gify/repositories/auth_repository_impl.dart';
import 'package:gify/repositories/users_repository.dart';
import 'package:gify/repositories/users_repository_impl.dart';
import 'package:gify/widgets/center_circular_progress_indicator.dart';
import 'package:gify/widgets/getX_widgets/getX_error_snack_bar.dart';

class AuthController extends GetxController {

  var _isAuthenticated = false.obs;
  var _user;

  final UsersRepository _usersRepository = UsersRepositoryImpl();
  final AuthRepository _authRepository = AuthRepositoryImpl();

  bool isUserLoggedIn() {
    return _isAuthenticated.value;
  }

  Future<void> loginUser({required String email, required String password}) async {
    try {
      Get.showOverlay(
        asyncFunction: () async {
          await _authRepository.loginUser(email: email, password: password);
          User fetchedUser = await _usersRepository.getUser(email: email);
          _user = fetchedUser.obs;
          _isAuthenticated = true.obs;
        },
        loadingWidget: centerCircularProgressIndicator(),
      );
      print("AuthController(loginUser): Successfully logged in user");
    } catch (e) {
      print("AuthController(loginUser): ${e.toString()}");
      _showErrorSnackBar(errorTitle: "Unable to login user", errorMessage: e.toString());
    }
  }

  Future<void> updateUser({required String email}) async {

    Future<void> updateUserProcess() async {
      User fetchedUser = await _usersRepository.getUser(email: email);
      _user = fetchedUser.obs;
      _isAuthenticated = true.obs;
    }

    try {
      await Get.showOverlay(
        asyncFunction: updateUserProcess,
        loadingWidget: centerCircularProgressIndicator(),
      );
      print("AuthController(updateUser): Successfully updated local user");
    } catch (e) {
      print("AuthController(signUpUser: ${e.toString()}");
      _showErrorSnackBar(errorTitle: "Unable to update user", errorMessage: e.toString());
    }
  }

  Future<void> signUpUser({required String email, required String password}) async {
    try {
      await Get.showOverlay(
        asyncFunction: () => _authRepository.signUpUser(email: email, password: password),
        loadingWidget: centerCircularProgressIndicator(),
      );
      print("AuthController(signUpUser): Successfully signed up user from device");
    } catch (e) {
      print("AuthController(signUpUser): ${e.toString()}");
      _showErrorSnackBar(errorTitle: "Unable to sign up user", errorMessage: e.toString());
    }
  }

  /// Helper method to display error snack bar
  void _showErrorSnackBar({required String errorTitle, required String errorMessage}) {
    getXErrorSnackBar(title: errorTitle, message: errorMessage);
  }
  
}