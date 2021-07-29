class Conversation {
  final String itemID;
  final String id;
  final List participants;
  final String lastMessage;
  final DateTime lastUpdate;

  Conversation({required this.itemID, required this.id, required this.participants, required this.lastMessage, required this.lastUpdate});

  factory Conversation.fromJson(Map<String, dynamic> json) {
    return Conversation(
      itemID: json['itemID'],
      id: json['id'],
      participants: json['participants'],
      lastMessage: json['lastMessage'],
      lastUpdate: json['lastUpdate'].toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'itemID' : itemID,
      'id' : id,
      'participants' : participants,
      'lastMessage' : lastMessage,
      'lastUpdate' : lastUpdate,
    };
  }

}