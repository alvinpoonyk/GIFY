import 'package:gify/models/message.dart';

abstract class MessagesRepository {
  Stream<List<Message>> getUserMessagesStreamFromRemoteDB({required String conversationID});
  Future<void> createMessageInRemoteDB(String conversationID, String senderID, String text, DateTime time, {Map<String, dynamic>? conversationMap});
}