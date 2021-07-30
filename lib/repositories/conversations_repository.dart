import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gify/models/conversation.dart';

abstract class ConversationsRepository {
  Stream<List<Conversation>> getUserConversationsStreamFromRemoteDB({required String userID});
  Conversation createLocalConversation({required String itemID, required String currentUserID, required String itemOwnerID});
  Future<bool> isExistingConversationInRemoteDB({required String itemID, required String currentUserID});
  Future<Conversation> getExistingConversationFromRemoteDB({required String itemID, required String currentUserID});
}


class ConversationsRepositoryImpl extends ConversationsRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  @override

  Stream<List<Conversation>> getUserConversationsStreamFromRemoteDB({required String userID}) async* {
    try {
      print("ConversationsRepositoryImpl(getUserConversationsStream): Stream opened");
      Stream<QuerySnapshot> source = _db.collection('conversations').where('participants', arrayContains: userID).orderBy('lastUpdate', descending: true).snapshots();
      await for (QuerySnapshot querySnapshot in source) {
        List<Conversation> conversations = [];
        querySnapshot.docs.forEach((documentSnapshot) {
          conversations.add(Conversation.fromJson(documentSnapshot.data() as Map<String, dynamic>));
        });
        yield conversations;
      }
    }
    catch(e) {
      print("ConversationsRepositoryImpl(getUserConversationsStream): ${e.toString()}");
      rethrow;
    }
  }

  @override
  Conversation createLocalConversation({required String itemID, required String currentUserID, required String itemOwnerID}) {
    final String conversationID = _db.collection('conversations').doc().id;
    return Conversation(itemID: itemID, id: conversationID, participants: [currentUserID, itemOwnerID], lastMessage: '', lastUpdate: DateTime.now());
  }

  @override
  Future<bool> isExistingConversationInRemoteDB({required String itemID, required String currentUserID}) async {
    try {
      return await _db.collection('conversations').where('itemID', isEqualTo: itemID).where('participants', arrayContains: currentUserID).get().then((querySnapshot) {
        if (querySnapshot.docs.isEmpty) 
          return false;
        return true;
      });
    } catch(e) {
      print("ConversationsRepositoryImpl(isExistingConversation): ${e.toString()}");
      rethrow;
    }
  }

  @override
  Future<Conversation> getExistingConversationFromRemoteDB({required String itemID, required String currentUserID}) async {
    try {
      return await _db.collection('conversations').where('itemID', isEqualTo: itemID).where('participants', arrayContains: currentUserID).get().then((querySnapshot) {
        final DocumentSnapshot documentSnapshot = querySnapshot.docs.first;
        return Conversation.fromJson(documentSnapshot.data() as Map<String, dynamic>);
      });
    } catch(e) {
      print("ConversationsRepositoryImpl(getExistingConversationFromRemoteDB): ${e.toString()}");
      rethrow;
    }
  }


}