import 'package:get/get.dart';
import 'package:gify/models/user.dart';
import 'package:gify/repositories/auth_repository.dart';
import 'package:gify/repositories/auth_repository_impl.dart';
import 'package:gify/repositories/users_repository.dart';
import 'package:gify/repositories/users_repository_impl.dart';
import 'package:gify/widgets/center_circular_progress_indicator.dart';
import 'package:gify/widgets/getX_widgets/getX_error_snack_bar.dart';

class AuthController extends GetxController {

  /// Bool stream to indicate authentication status
  Rx<bool> _isAuthenticated = false.obs;
  var _user;

  final UsersRepository _usersRepository = UsersRepositoryImpl();
  final AuthRepository _authRepository = AuthRepositoryImpl();

  /// Getter for user authentication status
  bool isUserLoggedIn() {
    return _isAuthenticated.value;
  }

  /// Getter for current userID
  String getCurrentUserID() {
    return _user.value.id;
  }

  /// Getter for current user object
  User getCurrentUser() {
    return _user.value;
  }

  /// Function to log the user out and empty user object and navigation
  Future<void> logOutUser() async {
    await _authRepository.logOut();
    _user = null;
    _isAuthenticated.toggle();
    Get.offAllNamed('/explore');

  }

  /// Function to log in user through the auth repository
  Future<void> loginUser({required String email, required String password}) async {

    Future<void> loginProcess() async {
      await _authRepository.loginUser(email: email, password: password);
      User fetchedUser = await _usersRepository.getUser(email: email);
      _user = fetchedUser.obs;
      _isAuthenticated.toggle();
    }

    try {
      await Get.showOverlay(
        asyncFunction: () => loginProcess(),
        loadingWidget: centerCircularProgressIndicator(),
      );
      print("AuthController(loginUser): Successfully logged in user");
    } catch (e) {
      print("AuthController(loginUser): ${e.toString()}");
      _showErrorSnackBar(errorTitle: "Unable to login user", errorMessage: e.toString());
      rethrow;
    }
  }

  /// Function to update the local user object once authentication is complete
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
      rethrow;
    }
  }

  /// Create an account for the user in auth and remote database
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
      rethrow;
    }
  }

  /// Helper method to display error snack bar
  void _showErrorSnackBar({required String errorTitle, required String errorMessage}) {
    getXErrorSnackBar(title: errorTitle, message: errorMessage);
  }

}