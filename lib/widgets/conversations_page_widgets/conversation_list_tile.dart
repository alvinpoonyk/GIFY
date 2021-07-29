import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gify/constants/styles.dart';
import 'package:gify/controllers/conversations_page_controller.dart';
import 'package:gify/models/conversation.dart';
import 'package:gify/models/user.dart';
import 'package:google_fonts/google_fonts.dart';

class ConversationsListTile extends StatelessWidget {
  final Conversation conversation;
  const ConversationsListTile({Key? key, required this.conversation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    final ConversationsPageController _controller = Get.find();
    return FutureBuilder<User>(
        future: _controller.getOtherUser(participants: conversation.participants),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            User otherUser = snapshot.data!;
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: _width * 0.05, vertical: 14),
              child: InkWell(
                onTap: () {
                  Map<String, String> params = {"id" : conversation.id};
                  Get.toNamed("/messages/", arguments: conversation, parameters: params);
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      minRadius: _width <= 414 ? 30 : 50,
                      maxRadius: _width <= 414 ? 30 : 50,
                      backgroundImage: NetworkImage(otherUser.profileImage),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        children: [
                          ConstrainedBox(
                            constraints: BoxConstraints(maxWidth: _width * 0.7, minWidth: _width * 0.7),
                            child: Text(
                              otherUser.displayName,
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.bold,
                                  fontSize: _width <= 414 ? 12 : 16, color: Colors.black),
                            ),
                          ),
                          const SizedBox(height: 5),
                          ConstrainedBox(
                            constraints: BoxConstraints(maxWidth: _width * 0.7, minWidth: _width * 0.7),
                            child: Text(
                              conversation.lastMessage.length > 140 ? conversation.lastMessage.substring(0,140) : conversation.lastMessage,
                              style: GoogleFonts.sen(
                                  fontSize: _width <= 414 ? 10 : 14, color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          else {
            return Center(
              child: const CircularProgressIndicator(color: kLightGreen),
            );
          }
        });
  }
}