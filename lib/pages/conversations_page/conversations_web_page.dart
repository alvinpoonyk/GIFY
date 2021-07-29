import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gify/controllers/conversations_page_controller.dart';
import 'package:gify/models/conversation.dart';
import 'package:gify/widgets/conversations_page_widgets/conversation_card.dart';
import 'package:gify/widgets/top_nav_bar.dart';
import 'package:gify/widgets/top_nav_drawer.dart';
import 'package:google_fonts/google_fonts.dart';

class ConversationsPageWebView extends StatelessWidget {
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
              NavigationBar(scaffoldKey: _scaffoldKey),
              const SizedBox(height: 10),
              SelectableText(
                'Past Conversations',
                style: GoogleFonts.montserrat(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: _width * 0.05),
                child: StreamBuilder<List<Conversation>>(
                  //TODO: REMOVE THIS HARDCODED SHIT
                    stream: _controller.getConversationsStream(userID: 'AxwkwQs6YLSrh9RYSj0J'),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      }
                      if (snapshot.hasData) {
                        List<Conversation>? conversations = snapshot.data;
                        return GridView.builder(
                            itemCount: conversations!.length,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                mainAxisExtent: 400,
                                crossAxisSpacing: 10,
                                crossAxisCount: _width < 768 ? 3 : 4,
                            ),
                            shrinkWrap: true,
                            controller: _scrollController,
                            addAutomaticKeepAlives: true,
                            itemBuilder: (BuildContext context, int index) {
                              return ConversationCard(conversation: conversations[index]);
                            },
                        );
                      }
                      return Text('Opps something went wrong!');
                    }
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}