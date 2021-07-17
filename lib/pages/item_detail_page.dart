import 'package:flutter/material.dart';
import 'package:gify/pages/item_detail_page/item_detail_tablet_mobile_page.dart';
import 'package:gify/pages/item_detail_page/item_detail_web_page.dart';

class ItemDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    if (_screenWidth > 768)
      return ItemDetailPageWebView();
    else
      return ItemDetailTabletAndMobileView();
  }
}





