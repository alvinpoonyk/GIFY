import 'package:get/get.dart';
import 'package:gify/controllers/auth_controller.dart';
import 'package:gify/models/conversation.dart';
import 'package:gify/models/item.dart';
import 'package:gify/models/message.dart';
import 'package:gify/models/user.dart';
import 'package:gify/repositories/items_repository.dart';
import 'package:gify/repositories/items_repository_impl.dart';
import 'package:gify/repositories/messages_repository.dart';
import 'package:gify/repositories/messages_repository_impl.dart';
import 'package:gify/repositories/users_repository.dart';
import 'package:gify/repositories/users_repository_impl.dart';
import 'package:gify/widgets/getX_widgets/getX_error_snack_bar.dart';

class MessagesPageController extends GetxController {
  RxList<Message> messages = <Message>[].obs;
  final String conversationID;
  final String itemID;
  final String otherUserID;

  final MessagesRepository _messagesRepository = MessagesRepositoryImpl();
  final ItemsRepository _itemsRepository = ItemsRepositoryImpl();
  final UsersRepository _usersRepository = UsersRepositoryImpl();
  final AuthController _authController = Get.find();

  final String errorTitle = "Opps, something went wrong..";

  MessagesPageController({required this.conversationID, required this.itemID, required this.otherUserID});

  void onInit() async {
    messages.bindStream(_messagesRepository.getUserMessagesStreamFromRemoteDB(conversationID: conversationID));
    super.onInit();
  }

   Future<Item?> getConversationItem({required String itemID}) async {
    try {
      return await _itemsRepository.getItemById(id: itemID);
    } catch(e) {
      print("MessagesPageController(getConversationItem): ${e.toString()}");
      _showErrorSnackBar(errorTitle: errorTitle ,errorMessage: e.toString());
    }

  }

  Future<User?> getOtherUser({required String id}) async {
    try {
      return await _usersRepository.getUserById(id: otherUserID);
    } catch(e) {
      print("MessagesPageController(getOtherUser): ${e.toString()}");
      _showErrorSnackBar(errorTitle: errorTitle ,errorMessage: e.toString());
    }

  }

  Future<void> addMessage({required String conversationID, required String text, required Conversation conversation}) async {
    try {
      return await _messagesRepository.createMessageInRemoteDB(conversationID, _authController.getCurrentUserID(), text, DateTime.now(), conversationMap: conversation.toJson());
    } catch(e) {
      print("MessagesPageController(addMessage): ${e.toString()}");
      _showErrorSnackBar(errorTitle: errorTitle ,errorMessage: e.toString());
    }
  }

  /// Helper method to display error snack bar
  void _showErrorSnackBar({required String errorTitle, required String errorMessage}) {
    getXErrorSnackBar(title: errorTitle, message: errorMessage);
  }

}