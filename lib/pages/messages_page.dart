import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gify/constants/styles.dart';
import 'package:gify/controllers/auth_controller.dart';
import 'package:gify/controllers/messages_page_controller.dart';
import 'package:gify/models/conversation.dart';
import 'package:gify/models/item.dart';
import 'package:gify/models/user.dart';
import 'package:gify/widgets/messages_page/receiver_message_bubble.dart';
import 'package:gify/widgets/messages_page/sender_message_bubble.dart';
import 'package:gify/widgets/top_nav_bar.dart';
import 'package:gify/widgets/top_nav_drawer.dart';
import 'package:google_fonts/google_fonts.dart';

class MessagesPage extends StatefulWidget {
  @override
  _MessagesPageState createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final Conversation _conversation = Get.arguments;
    final ScrollController _scrollController = ScrollController();
    final AuthController _authController = Get.find();
    final otherUserID = _conversation.participants[0].compareTo(_authController.getCurrentUserID()) == 0 ? _conversation.participants[1] : _conversation.participants[0];
    final MessagesPageController _controller = Get.put(
        MessagesPageController(
            conversationID: _conversation.id,
            itemID: _conversation.itemID,
            otherUserID: otherUserID
        ));
    double _width = MediaQuery.of(context).size.width;

    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
    final TextEditingController _messageTextController = _controller.messageTextController;
    return SafeArea(
      child: Scaffold(
        drawer: const TopNavDrawer(),
        key: _scaffoldKey,
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Expanded(
                  flex: 9,
                  child: Column(
                    children: [
                      NavigationBar(scaffoldKey: _scaffoldKey),
                      const SizedBox(height: 10),
                      Padding(
                        padding: _width <= 768
                            ? const EdgeInsets.all(0)
                            : EdgeInsets.symmetric(horizontal: _width * 0.05),
                        child: Container(
                          decoration: BoxDecoration(
                            color: kDarkGreen,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.all(_width <= 768
                                ? const Radius.circular(0)
                                : const Radius.circular(10)),
                          ),
                          padding: const EdgeInsets.all(12),
                          width: _width <= 768 ? _width : _width * 0.9,
                          child: Center(
                            child: FutureBuilder<Item?>(
                              future: _controller.getConversationItem(itemID: _conversation.itemID),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  Item item = snapshot.data!;
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                          width: 50,
                                          height: 35,
                                          child: Image.network(item.images.first),
                                      ),
                                      const SizedBox(width: 20),
                                      Container(
                                        child: TextButton(
                                          onPressed: () {},
                                          child: Text(
                                            item.name,
                                            style: GoogleFonts.montserrat(
                                              fontWeight: FontWeight.w500,
                                              fontSize: _width < 768 ? 16 : 24,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                } else {
                                  return Center(
                                      child: CircularProgressIndicator(color: kLightGreen),
                                  );
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 14),
                      Expanded(
                        child: FutureBuilder<User?>(
                            future: _controller.getOtherUser(id: otherUserID),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                User otherUser = snapshot.data!;
                                return Padding(
                                  padding: EdgeInsets.symmetric(horizontal: _width * 0.05),
                                  child: Obx(() => ListView.builder(
                                      reverse: true,
                                      itemCount: _controller.messages.length,
                                      shrinkWrap: true,
                                      controller: _scrollController,
                                      itemBuilder: (context, index) {
                                        if (_controller.messages[index].sender.compareTo(_authController.getCurrentUserID()) == 0)
                                          return ReceiverMessageBubble(message: _controller.messages[index]);
                                        return SenderMessageBubble(sender: otherUser, message: _controller.messages[index]);
                                      })),
                                );
                              } else {
                                return Center(
                                  child: CircularProgressIndicator(color: kLightGreen),
                                );
                              }
                            }),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: _width * 0.05),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: const ShapeDecoration(
                              shape: const RoundedRectangleBorder(
                                side: const BorderSide(
                                    width: 1,
                                    style: BorderStyle.solid,
                                    color: kDarkGreen),
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(10),
                                ),
                              ),
                            ),
                            child: Form(
                              key: _formKey,
                              child: TextFormField(
                                controller: _messageTextController,
                                decoration: InputDecoration(
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  contentPadding: const EdgeInsets.only(
                                      left: 15, bottom: 11, top: 11, right: 15),
                                  hintText: "Type your message here",
                                  hintStyle: GoogleFonts.roboto(
                                    fontSize: 16,
                                    color: Color(0xFFC4C4C4),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        kDarkGreen),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ))),
                            onPressed: () async {
                              _controller.addMessage(conversationID: _conversation.id, text: _messageTextController.text.isEmpty ? " " : _messageTextController.text, conversation: _conversation);
                              _messageTextController.clear();
                              _scrollController.animateTo(
                                  _scrollController.position.minScrollExtent,
                                  duration: Duration(seconds: 1),
                                  curve: Curves.fastOutSlowIn);
                            },
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(18, 8, 18, 8),
                              child: Text(
                                'Send',
                                style: GoogleFonts.roboto(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
