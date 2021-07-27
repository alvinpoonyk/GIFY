import 'package:flutter/material.dart';
import 'package:gify/widgets/conversations_page_widgets/conversation_list_tile.dart';
import 'package:gify/widgets/top_nav_bar.dart';
import 'package:gify/widgets/top_nav_drawer.dart';
import 'package:google_fonts/google_fonts.dart';

class ConversationsPageTabletAndMobileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
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
              ListView(
                shrinkWrap: true,
                children: [
                  ConversationsListTile(width: _width),
                  ConversationsListTile(width: _width),
                  ConversationsListTile(width: _width),
                  ConversationsListTile(width: _width),
                  ConversationsListTile(width: _width),
                  ConversationsListTile(width: _width),
                  ConversationsListTile(width: _width),
                  ConversationsListTile(width: _width),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
