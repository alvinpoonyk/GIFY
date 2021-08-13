import 'package:get/get.dart';
import 'package:gify/controllers/auth_controller.dart';
import 'package:gify/models/item.dart';
import 'package:gify/repositories/items_repository.dart';
import 'package:gify/repositories/items_repository_impl.dart';
import 'package:gify/widgets/getX_widgets/getX_error_snack_bar.dart';

class ProfilePageController extends GetxController {
  RxList<Item> itemsToDisplay = <Item>[].obs;

  final ItemsRepository _itemsRepository = ItemsRepositoryImpl();
  final AuthController _authController = Get.find();

  final errorTitle = 'Oops, something went wrong...';

  @override
  void onInit() {
    itemsToDisplay.bindStream(getUserItemsAsStream(userID: _authController.getCurrentUserID())!);
    super.onInit();
  }

  /// Function that returns a list of user items as Stream from item repository
  Stream<List<Item>>? getUserItemsAsStream({required String userID}) {
    try {
      print("ProfilePageController(getUserItems): Successfully fetched user items from database");
      return _itemsRepository.getUserItemsStream(userID: userID);
    } catch (e) {
      print("ProfilePageController(getUserItems): ${e.toString()}");
      _showErrorSnackBar(errorTitle: errorTitle, errorMessage: e.toString());
    }
  }

  /// Function that removes an item
  Future<void> removeItem({required String id}) async {
    try {
      await _itemsRepository.removeItem(id: id);
      print("ProfilePageController(removeItem): Successfully removed item from user profile");
    } catch(e) {
      print("ProfilePageController(removeItem): ${e.toString()}");
      _showErrorSnackBar(errorTitle: errorTitle, errorMessage: e.toString());
    }
  }

  /// Helper method to display error snack bar
  void _showErrorSnackBar({required String errorTitle, required String errorMessage}) {
    getXErrorSnackBar(title: errorTitle, message: errorMessage);
  }

}

