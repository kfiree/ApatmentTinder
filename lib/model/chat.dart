import 'message.dart';

class Chat {
  String id;
  Message lastMessage;

  Chat(this.id, this.lastMessage);

  // Chat.fromSnapshot(DocumentSnapshot snapshot) {
  // id = snapshot['id'];
  // lastMessage = snapshot['last_message'] != null
  // ? Message.fromMap(snapshot['last_message'])
  // : null;
  // }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'last_message': Message(1, true, "fd",
          "s"), //lastMessage != null ? lastMessage.toMap() : null,
    };
  }
}
