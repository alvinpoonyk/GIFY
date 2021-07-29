import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gify/constants/styles.dart';
import 'package:gify/controllers/conversations_page_controller.dart';
import 'package:gify/models/conversation.dart';
import 'package:gify/widgets/conversations_page_widgets/conversation_list_tile.dart';
import 'package:gify/widgets/top_nav_bar.dart';
import 'package:gify/widgets/top_nav_drawer.dart';
import 'package:google_fonts/google_fonts.dart';

class ConversationsPageTabletAndMobileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    double _width = MediaQuery.of(context).size.width;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
    final ScrollController _scrollController = ScrollController();
    final ConversationsPageController _controller = Get.put(ConversationsPageController());

    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: const TopNavDrawer(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  NavigationBar(scaffoldKey: _scaffoldKey),
                  const SizedBox(height: 10),
                  SelectableText(
                    'Past Conversations',
                    style: GoogleFonts.montserrat(
                        fontSize: _width <= 414 ? 14 : 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
              StreamBuilder<List<Conversation>>(
                  stream: _controller.getConversationsStream(userID: 'AxwkwQs6YLSrh9RYSj0J'),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<Conversation>? conversations = snapshot.data;
                      if (conversations!.isEmpty || conversations == null)
                        return Text('You have no conversations');
                      return ListView.builder(
                          addAutomaticKeepAlives: true,
                          itemCount: conversations.length,
                          controller: _scrollController,
                          shrinkWrap: true,
                          itemBuilder: (context, index) => ConversationsListTile(conversation: conversations[index]));
                    }
                    if (snapshot.hasError) {
                      return Text(snapshot.error.toString());
                    }
                    return Center(
                      child: const CircularProgressIndicator(color: kLightGreen),
                    );
                  },
              ),
              // ListView(
              //   shrinkWrap: true,
              //   children: [
              //     ConversationsListTile(width: _width),
              //     ConversationsListTile(width: _width),
              //     ConversationsListTile(width: _width),
              //     ConversationsListTile(width: _width),
              //     ConversationsListTile(width: _width),
              //     ConversationsListTile(width: _width),
              //     ConversationsListTile(width: _width),
              //     ConversationsListTile(width: _width),
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }
}
