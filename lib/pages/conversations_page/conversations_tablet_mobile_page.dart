import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gify/constants/styles.dart';
import 'package:gify/controllers/conversations_page_controller.dart';
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
              Obx(() {
                return _controller.conversations.isEmpty ?
                  Center(
                    child: SelectableText(
                      'You have no conversations',
                      style: GoogleFonts.montserrat(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: kDarkGreen),
                    ),
                  ) :
                ListView.builder(
                    addAutomaticKeepAlives: true,
                    itemCount: _controller.conversations.length,
                    controller: _scrollController,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => ConversationsListTile(conversation: _controller.conversations[index]));
              }),
            ],
          ),
        ),
      ),
    );
  }
}
