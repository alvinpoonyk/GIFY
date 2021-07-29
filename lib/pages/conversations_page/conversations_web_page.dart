import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gify/constants/styles.dart';
import 'package:gify/controllers/conversations_page_controller.dart';
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
              Obx(() {
                return _controller.conversations.isEmpty ?
                Center(
                  child: SelectableText(
                    'You have no conversations',
                    style: GoogleFonts.montserrat(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: kDarkGreen),
                  ),
                ) :
                 GridView.builder(
                    itemCount: _controller.conversations.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: 400,
                        crossAxisSpacing: 10,
                        crossAxisCount: _width < 768 ? 3 : 4,
                    ),
                    shrinkWrap: true,
                    controller: _scrollController,
                    addAutomaticKeepAlives: true,
                    itemBuilder: (BuildContext context, int index) {
                      return ConversationCard(conversation: _controller.conversations[index]);
                    },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}