import 'package:get/get.dart';
import 'package:gify/models/conversation.dart';
import 'package:gify/models/item.dart';
import 'package:gify/models/user.dart';
import 'package:gify/repositories/conversations_repository.dart';
import 'package:gify/repositories/items_repository.dart';
import 'package:gify/repositories/items_repository_impl.dart';
import 'package:gify/repositories/users_repository.dart';
import 'package:gify/repositories/users_repository_impl.dart';

class ItemDetailPageController extends GetxController {

  final ItemsRepository _itemsRepository = ItemsRepositoryImpl();
  final UsersRepository _usersRepository = UsersRepositoryImpl();
  final ConversationsRepository _conversationsRepository = ConversationsRepositoryImpl();
  var id;
  var item;
  var owner;

  ItemDetailPageController({this.id, this.item});

  Future<void> getItemByID({required String id}) async {
    try {
        final Item fetchedItem = await _itemsRepository.getItemById(id: id);
        item = fetchedItem;
        print("ItemDetailPageController(getItemByID): Get and set item $id success");
      }
    catch(e) {
    print("ItemDetailPageController(getItemByID): ${e.toString()}");
    }
  }

  Future<void> getItemOwnerByID({required String ownerID}) async {
    try {
      final User fetchedUser = await _usersRepository.getUserById(id: ownerID);
      owner = fetchedUser;
      print("ItemDetailPageController(getItemOwnerByID): Get and set owner $ownerID success");
    } catch(e) {
      print("ItemDetailPageController(getItemOwnerByID): ${e.toString()}");
    }
  }

  Conversation? createConversation({required String itemID, required String currentUserID, required String itemOwnerID}) {
    try {
      return _conversationsRepository.createLocalConversation(itemID: itemID, currentUserID: currentUserID, itemOwnerID: itemOwnerID);
    } catch(e) {
      print("ItemDetailPageController(createConversation): ${e.toString()}");
    }
  }

  Future<bool?> isConversationExist({required String itemID, required String currentUserID, required String itemOwnerID}) async {
    try {
      return await _conversationsRepository.isExistingConversationInRemoteDB(itemID: itemID, currentUserID: currentUserID);
    } catch(e) {
      print("ItemDetailPageController(isConversationExist): ${e.toString()}");
    }
  }

  Future<Conversation?> getExistingConversation({required String itemID, required String currentUserID}) async {
    try {
      return await _conversationsRepository.getExistingConversationFromRemoteDB(itemID: itemID, currentUserID: currentUserID);
    } catch(e) {
      print("ItemDetailPageController(isConversationExist): ${e.toString()}");
    }
  }

}