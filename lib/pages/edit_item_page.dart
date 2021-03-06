import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gify/controllers/edit_item_page_controller.dart';
import 'package:gify/pages/edit_item_page/edit_item_tablet_mobile_page.dart';
import 'package:gify/pages/edit_item_page/edit_item_web_page.dart';

class EditItemPage extends StatelessWidget {
  final editItemPageController = Get.put(EditItemPageController(item: Get.arguments));
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    if (_width <= 768)
      return EditItemPageTabletAndMobileView();
    return EditItemPageWebView();
  }
}