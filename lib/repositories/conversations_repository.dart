import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gify/models/conversation.dart';

abstract class ConversationsRepository {
  Stream<List<Conversation>> getUserConversationsStreamFromRemoteDB({required String userID});
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


}