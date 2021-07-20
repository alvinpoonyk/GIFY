import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gify/pages/add_item_page/add_item_tablet_mobile_page.dart';
import 'package:gify/pages/add_item_page/add_item_web_page.dart';

class AddItemPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    if (_width <= 768)
      return AddItemPageTabletAndMobileView();
    return AddItemPageWebView();
  }
}