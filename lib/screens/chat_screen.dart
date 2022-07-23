import 'package:flutter/material.dart';

import '../Style/colors.dart';
import '../model/message.dart';
import '../widgets/message_bubble.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({Key? key}) : super(key: key);

  final ScrollController _scrollController = ScrollController();
  final messageTextController = TextEditingController();
  final String myUserId = "1";
  final currTime = DateTime.now().millisecondsSinceEpoch;
  final List<bool> showTimeList = [];

  static const String id = "chat";

  List<Widget> messagesList = [
    ListTile(
        title: MessageBubble(
      epochTimeMs: messages[1].epochTimeMs,
      text: messages[1].text,
      isSenderMyUser: messages[1].senderId == "1",
      includeTime: true,
    )),
    ListTile(
        title: MessageBubble(
      epochTimeMs: messages[2].epochTimeMs,
      text: messages[2].text,
      isSenderMyUser: messages[2].senderId == "1",
      includeTime: true,
    )),
    ListTile(
        title: MessageBubble(
      epochTimeMs: messages[3].epochTimeMs,
      text: messages[3].text,
      isSenderMyUser: messages[3].senderId == "1",
      includeTime: true,
    )),
    ListTile(
        title: MessageBubble(
      epochTimeMs: messages[4].epochTimeMs,
      text: messages[4].text,
      isSenderMyUser: messages[4].senderId == "1",
      includeTime: true,
    )),
    ListTile(
        title: MessageBubble(
      epochTimeMs: messages[5].epochTimeMs,
      text: messages[5].text,
      isSenderMyUser: messages[5].senderId == "1",
      includeTime: true,
    )),
    ListTile(
        title: MessageBubble(
      epochTimeMs: messages[6].epochTimeMs,
      text: messages[6].text,
      isSenderMyUser: messages[6].senderId == "1",
      includeTime: false,
    )),
    ListTile(
        title: MessageBubble(
      epochTimeMs: messages[7].epochTimeMs,
      text: messages[7].text,
      isSenderMyUser: messages[7].senderId == "1",
      includeTime: false,
    )),
    ListTile(
        title: MessageBubble(
      epochTimeMs: messages[8].epochTimeMs,
      text: messages[8].text,
      isSenderMyUser: messages[8].senderId == "1",
      includeTime: true,
    )),
    ListTile(
        title: MessageBubble(
      epochTimeMs: messages[9].epochTimeMs,
      text: messages[9].text,
      isSenderMyUser: messages[9].senderId == "1",
      includeTime: false,
    )),
    ListTile(
        title: MessageBubble(
      epochTimeMs: messages[10].epochTimeMs,
      text: messages[10].text,
      isSenderMyUser: messages[10].senderId == "1",
      includeTime: false,
    )),
    ListTile(
        title: MessageBubble(
      epochTimeMs: messages[11].epochTimeMs,
      text: messages[11].text,
      isSenderMyUser: messages[11].senderId == "1",
      includeTime: false,
    )),
    ListTile(
        title: MessageBubble(
      epochTimeMs: messages[12].epochTimeMs,
      text: messages[12].text,
      isSenderMyUser: messages[12].senderId == "1",
      includeTime: false,
    )),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: chatTitle()),
      body: Column(
        children: [
          Expanded(
            child: ListView(children: messagesList),
          ),
          getBottomContainer(context, myUserId)
        ],
      ),
    );
  }

  Widget getBottomContainer(BuildContext context, String myUserId) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 1.0,
            color: kSecondaryColor.withOpacity(0.5),
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: TextField(
                controller: messageTextController,
                textCapitalization: TextCapitalization.sentences,
                style: TextStyle(color: kSecondaryColor),
                decoration: InputDecoration(
                    labelText: 'Message',
                    labelStyle:
                        TextStyle(color: kSecondaryColor.withOpacity(0.5)),
                    contentPadding: EdgeInsets.all(0)),
              ),
            ),
            RaisedButton(
              padding: EdgeInsets.all(10),
              highlightElevation: 0,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)),
              child: Text(
                "SEND",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              onPressed: () {
                sendMessage(myUserId);
              },
            ),
          ],
        ),
      ),
    );
  }

  void sendMessage(String myUserId) {
    if (messageTextController.text.isEmpty) return;

    Message message = Message(
      DateTime.now().millisecondsSinceEpoch,
      false,
      myUserId,
      messageTextController.text,
    );

    messages.add(message);

    messageTextController.clear();
  }
}

Row chatTitle() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: kAccentColor, width: 1.0),
            ),
            child: CircleAvatar(
                radius: 22, backgroundImage: NetworkImage(itayPic)),
            // Image.asset(
            // widget.appartment.photoPath,
            // fit: BoxFit.fill,
            // ),
          )
        ],
      ),
      const SizedBox(width: 10),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'Pacifico',
                fontSize: 20.0,
                color: kAccentColor,
                fontWeight: FontWeight.w800 //.bold,
                ), //todo use this Theme.of(context).textTheme.bodyText1,
            "איתי הקשוח",
          ),
        ],
      ),
    ],
  );
}

String itayPic =
    "https://scontent.ftlv1-1.fna.fbcdn.net/v/t1.6435-9/35842345_10214608949391871_788869433668927488_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=4fF-GPQRT10AX-P5Gr8&_nc_ht=scontent.ftlv1-1.fna&oh=00_AT8ZLYP3Ttl6vOWLa9yjPl86EdkZL7oEhUYW8LTjtTZ3YA&oe=62FFA8E1";

int minutInMS = 60000;
int currTime = DateTime.now().millisecondsSinceEpoch;

List<Message> messages = [
  Message(currTime + minutInMS * 2, true, "1", "היי"),
  Message(currTime + minutInMS * 3, true, "2", "היי יו"),
  Message(currTime + minutInMS * 3 + 10000, true, "1", "תביא תדירה"),
  Message(currTime + minutInMS * 4, true, "2", "סגור, כמה משלם?"),
  Message(currTime + minutInMS * 12, true, "1", "כמה שצריך אחי. חייב דירה!"),
  Message(currTime + minutInMS * 12 + 10009, true, "2",
      "סגור, אסור כלבים אבל כן? ומעבירים את הכסף כל חודש בראשון."),
  Message(currTime + minutInMS * 13, true, "2",
      "ואתה חייב לקנות את כל הרהיטים כי ככה זה בתל אביב.."),
  Message(currTime + minutInMS * 15, true, "1", "יאללה"),
  Message(currTime + minutInMS * 15, true, "2", "יאללה"),
  Message(currTime + minutInMS * 16, true, "1", "טיל 🍆"),
  Message(currTime + minutInMS * 16, true, "2", "טיל"),
  Message(currTime + minutInMS * 20, true, "1", "ביי מלך..🧡😙"),
  Message(currTime + minutInMS * 20, true, "2", "שמור על עצמך קסם 🖕🖕")
];
