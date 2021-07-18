import 'package:flutter/material.dart';
import 'package:gify/widgets/conversations_page_widgets/conversation_card.dart';
import 'package:gify/widgets/top_nav_bar.dart';
import 'package:gify/widgets/top_nav_drawer.dart';
import 'package:google_fonts/google_fonts.dart';

class ConversationsPageWebView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: TopNavDrawer(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              navigationBar(screenWidth: _width, scaffoldKey: _scaffoldKey),
              SizedBox(height: 10),
              SelectableText(
                'Past Conversations',
                style: GoogleFonts.montserrat(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: _width * 0.05),
                /// CHANGE THIS TO GRID VIEW
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ConversationCard(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}