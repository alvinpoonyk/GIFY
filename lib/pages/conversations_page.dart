import 'package:flutter/material.dart';
import 'package:gify/pages/conversations_page/conversations_tablet_mobile_page.dart';
import 'package:gify/pages/conversations_page/conversations_web_page.dart';

class ConversationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    if (_width <= 768)
      return ConversationsPageTabletAndMobileView();
    return ConversationsPageWebView();
  }
}
