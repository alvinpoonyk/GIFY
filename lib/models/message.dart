class Message {
  final String id;
  final String sender;
  final String text;
  final DateTime timeSent;

  Message({required this.id, required this.sender, required this.text, required this.timeSent});

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json['id'],
      sender: json['sender'],
      text: json['text'],
      timeSent: json['timeSent'].toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id' : id,
      'sender' : sender,
      'text' : text,
      'timeSent' : timeSent,
    };
  }
}