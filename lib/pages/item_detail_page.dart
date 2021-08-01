import 'package:flutter/material.dart';
import 'package:gify/constants/styles.dart';
import 'package:gify/controllers/item_detail_page_controller.dart';
import 'package:gify/models/item.dart';
import 'package:gify/pages/item_detail_page/item_detail_tablet_mobile_page.dart';
import 'package:gify/pages/item_detail_page/item_detail_web_page.dart';
import 'package:get/get.dart';

class ItemDetailPage extends StatelessWidget {

  final Item? _item = Get.arguments;
  final String? _id = Get.parameters['id'];
  final ItemDetailPageController _controller = Get.put(ItemDetailPageController());

  @override
  Widget build(BuildContext context) {
    _controller.item = _item;
    _controller.id = _id;
    if (_controller.item != null) {
      return ResponsiveItemDetailPage();
    }
    return FutureBuilder(
      future: _controller.getItemByID(id: _id!),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ResponsiveItemDetailPage();
        } else {
          return const Center(
              child: const CircularProgressIndicator(color: kLightGreen),
          );
        }
      });
  }
}

class ResponsiveItemDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    if (_screenWidth > 768)
      return ItemDetailPageWebView();
    return ItemDetailTabletAndMobileView();
  }
}





