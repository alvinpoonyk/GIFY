import 'package:get/get.dart';
import 'package:gify/controllers/auth_controller.dart';
import 'package:gify/repositories/items_repository.dart';
import 'package:gify/repositories/items_repository_impl.dart';
import 'package:gify/widgets/getX_widgets/getX_error_snack_bar.dart';

class ProfilePageController extends GetxController {
  var itemsToDisplay = [].obs;

  final ItemsRepository _itemsRepository = ItemsRepositoryImpl();
  final AuthController _authController = Get.find();

  final errorTitle = 'Oops, something went wrong...';

  @override
  void onInit() {
    getUserItems(userID: _authController.getCurrentUserID());
    super.onInit();
  }

  getUserItems({required String userID}) async {
    try {
      itemsToDisplay.clear();
      await _itemsRepository.getUserItems(userID: userID).then((items) => items.forEach((item) => itemsToDisplay.add(item)));
      print("ProfilePageController(getUserItems): Successfully fetched user items from database");
    } catch (e) {
      print("ProfilePageController(getUserItems): ${e.toString()}");
      _showErrorSnackBar(errorTitle: errorTitle, errorMessage: e.toString());
    }
  }

  removeItem() async {
    //TODO: add logic to remove item
    itemsToDisplay.clear();
  }

  /// Helper method to display error snack bar
  void _showErrorSnackBar({required String errorTitle, required String errorMessage}) {
    getXErrorSnackBar(title: errorTitle, message: errorMessage);
  }

}

