import 'package:flutter/widgets.dart';
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

  String conversationID = '';
  String itemID = '';
  String otherUserID = '';

  final MessagesRepository _messagesRepository = MessagesRepositoryImpl();
  final ItemsRepository _itemsRepository = ItemsRepositoryImpl();
  final UsersRepository _usersRepository = UsersRepositoryImpl();
  final AuthController _authController = Get.find();
  final TextEditingController messageTextController = TextEditingController();

  final String errorTitle = "Opps, something went wrong..";

  void onInit() {
    /// Binds the stream upon initialisation so that it will always get updated
    messages.bindStream(_messagesRepository.getUserMessagesStreamFromRemoteDB(conversationID: conversationID));
    super.onInit();
  }

  void onClose()  {
    /// Disposal of text controllers when not in used to avoid memory leak
    messageTextController.dispose();
    super.onClose();
  }

  /// Initialised the messages stream by clearing it first and then fetching the stream of messages
  void init({required String id, required String currentItemID, required String otherCurrentUserID }) {
    messages.clear();
    conversationID = id;
    itemID = currentItemID;
    otherUserID = otherCurrentUserID;
    messages.bindStream(_messagesRepository.getUserMessagesStreamFromRemoteDB(conversationID: conversationID));
  }

  /// Function to get the item object that the conversation is about
   Future<Item?> getConversationItem({required String itemID}) async {
    try {
      return await _itemsRepository.getItemById(id: itemID);
    } catch(e) {
      print("MessagesPageController(getConversationItem): ${e.toString()}");
      _showErrorSnackBar(errorTitle: errorTitle ,errorMessage: e.toString());
    }

  }

  /// Function to get the user object that current user is talking to
  Future<User?> getOtherUser({required String id}) async {
    try {
      return await _usersRepository.getUserById(id: otherUserID);
    } catch(e) {
      print("MessagesPageController(getOtherUser): ${e.toString()}");
      _showErrorSnackBar(errorTitle: errorTitle ,errorMessage: e.toString());
    }

  }

  /// Function to add a message into remote database
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