import 'package:get/get.dart';
import 'package:gify/controllers/auth_controller.dart';
import 'package:gify/models/item.dart';
import 'package:gify/models/user.dart';
import 'package:gify/repositories/conversations_repository.dart';
import 'package:gify/models/conversation.dart';
import 'package:gify/repositories/items_repository.dart';
import 'package:gify/repositories/items_repository_impl.dart';
import 'package:gify/repositories/users_repository.dart';
import 'package:gify/repositories/users_repository_impl.dart';
import 'package:gify/widgets/getX_widgets/getX_error_snack_bar.dart';

class ConversationsPageController extends GetxController {
  final ConversationsRepository _conversationsRepository = ConversationsRepositoryImpl();
  final UsersRepository _usersRepository = UsersRepositoryImpl();
  final AuthController _authController = Get.find();
  final ItemsRepository _itemsRepository = ItemsRepositoryImpl();
  final String errorTitle = "Ops, something went wrong!";

  RxList<Conversation> conversations = <Conversation>[].obs;

  void onInit() {
    conversations.bindStream(_getConversationsStream(userID: _authController.getCurrentUserID())!);
    super.onInit();
  }

  Stream<List<Conversation>>? _getConversationsStream({required String userID}) {
    try {
      print("ConversationsPageController(getConversationsStream): Getting conversation stream from remote database...");
      return _conversationsRepository.getUserConversationsStreamFromRemoteDB(userID: userID);
    } catch(e) {
      print("ConversationsPageController(getConversationsStream): ${e.toString()}");
      _showErrorSnackBar(errorTitle: errorTitle ,errorMessage: e.toString());
    }
  }

  Future<User?> getOtherUser({required List participants}) async {
    try {
      final String currentUserId = _authController.getCurrentUserID();
      return _usersRepository.getUserById(id: currentUserId.compareTo(participants[0]) == 0 ? participants[1] : participants[0]);
    } catch(e) {
      print("ConversationsPageController(getOtherUserByID): ${e.toString()}");
      _showErrorSnackBar(errorTitle: errorTitle ,errorMessage: e.toString());
    }
  }

  Future<Item?> getItem({required String itemID}) async {
    try {
      return _itemsRepository.getItemById(id: itemID);
    } catch(e) {
      print("ConversationsPageController(getItem): ${e.toString()}");
      _showErrorSnackBar(errorTitle: errorTitle ,errorMessage: e.toString());
    }
  }

  /// Helper method to display error snack bar
  void _showErrorSnackBar({required String errorTitle, required String errorMessage}) {
    getXErrorSnackBar(title: errorTitle, message: errorMessage);
  }

}