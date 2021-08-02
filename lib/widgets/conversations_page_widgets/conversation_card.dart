import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gify/constants/styles.dart';
import 'package:gify/controllers/conversations_page_controller.dart';
import 'package:gify/models/conversation.dart';
import 'package:gify/models/item.dart';
import 'package:gify/models/user.dart';
import 'package:google_fonts/google_fonts.dart';

class ConversationCard extends StatelessWidget {
  final Conversation conversation;
  const ConversationCard({Key? key, required this.conversation,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ConversationsPageController _controller = Get.find();
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 300 , minWidth: 300),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 14),
              FutureBuilder<User?>(
                  future: _controller.getOtherUser(participants: conversation.participants),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      User otherUser = snapshot.data!;
                      return Column(
                        children: [
                          CircleAvatar(
                            minRadius: 60,
                            maxRadius: 60,
                            backgroundImage: NetworkImage(otherUser.profileImage),
                          ),
                          const SizedBox(height: 12),
                          ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 300 , minWidth: 300),
                            child: Text(
                              otherUser.displayName,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16, color: Colors.black),
                            ),
                          ),
                        ],
                      );
                    }
                    return const CircularProgressIndicator(color: kLightGreen);
                  }),
              const SizedBox(height: 20),
              FutureBuilder<Item?>(
                  future: _controller.getItem(itemID: conversation.itemID),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      Item item = snapshot.data!;
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 40,
                            height: 40,
                            child: Image.network(item.images[0]),
                          ),
                          const SizedBox(width: 14),
                          Text(
                            item.name.length < 20 ? item.name : item.name.substring(0, 20),
                            textAlign: TextAlign.left,
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w400,
                                fontSize: 14, color: Colors.black),
                          ),
                        ],
                      );
                    }
                    return const CircularProgressIndicator(color: kLightGreen);
                  },
              ),
              const SizedBox(height: 20),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 270 , minWidth: 270, maxHeight: 60, minHeight: 60),
                child: SelectableText(
                  conversation.lastMessage,
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w300,
                      fontSize: 14, color: Colors.black),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all<Color>(kDarkGreen),
                      shape: MaterialStateProperty.all<
                          RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ))),
                  onPressed: () {
                    Get.offAndToNamed("/messages/", arguments: conversation);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Center(
                      child: Text(
                        'View Conversation',
                        style: GoogleFonts.sen(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}