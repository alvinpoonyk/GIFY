import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gify/models/message.dart';
import 'package:gify/repositories/messages_repository.dart';

class MessagesRepositoryImpl extends MessagesRepository {

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  @override
  Stream<List<Message>> getUserMessagesStreamFromRemoteDB({required String conversationID}) async* {
    try {
      print(
          "MessagesRepositoryImpl(getUserMessagesStreamFromRemoteDB): Stream opened");
      Stream<QuerySnapshot> source = _db.collection('conversations').doc(
          conversationID).collection('messages').orderBy(
          'timeSent', descending: true).snapshots();
      await for (QuerySnapshot querySnapshot in source) {
        List<Message> messages = [];
        querySnapshot.docs.forEach((documentSnapshot) {
          messages.add(
              Message.fromJson(documentSnapshot.data() as Map<String, dynamic>));
        });
        yield messages;
      }
    } catch(e) {
      print("MessagesRepositoryImpl(getUserMessagesStreamFromRemoteDB): ${e.toString()}");
      rethrow;
    }
  }

  @override
  // Future<void> createMessageInRemoteDB({required String conversationID, required String senderID, required String text, required DateTime time}) async {
  Future<void> createMessageInRemoteDB(String conversationID, String senderID, String text, DateTime time, {Map<String, dynamic>? conversationMap}) async {
    try {
      bool isConversationExistInRemoteDB = await _db.collection('conversations').doc(conversationID).get().then((documentSnapshot) => documentSnapshot.exists);

      late DocumentReference conversationDoc;

      if (!isConversationExistInRemoteDB)
        await _db.collection('conversations').doc(conversationID).set(conversationMap!);

      conversationDoc = _db.collection('conversations').doc(conversationID);
      final CollectionReference messages = conversationDoc.collection('messages');
      final DocumentReference messageDoc = messages.doc();
      final String messageID = messageDoc.id;
      final WriteBatch batch = _db.batch();

      batch.set(messageDoc, {
        "id" : messageID,
        "sender" : senderID,
        "text" : text,
        "timeSent" : time
      });

      batch.update(conversationDoc, {
        "lastUpdate" : time,
        "lastMessage" : text,
      });

      return await batch.commit().then((_) => print("MessagesRepositoryImpl(createMessageInRemoteDB): Message written"));


    } catch(e) {
      print("MessagesRepositoryImpl(createMessageInRemoteDB): ${e.toString()}");
      rethrow;
    }

  }


}