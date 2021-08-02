import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gify/controllers/edit_item_page_controller.dart';
import 'package:gify/widgets/edit_item_page/edit_item_form.dart';
import 'package:gify/widgets/edit_item_page/image_picker_box.dart';
import 'package:gify/widgets/top_nav_bar.dart';
import 'package:gify/widgets/top_nav_drawer.dart';
import 'package:google_fonts/google_fonts.dart';

class EditItemPageTabletAndMobileView extends StatelessWidget {
  static final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final EditItemPageController _controller = Get.find();
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
          drawer: const TopNavDrawer(),
          key: _scaffoldKey,
          body: SingleChildScrollView(
            child: Column(
              children: [
                NavigationBar(scaffoldKey: _scaffoldKey),
                const SizedBox(height: 10),
                Center(
                  child: SelectableText(
                    'Edit Item',
                    style: GoogleFonts.montserrat(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: _width * 0.05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Obx(() => ImagePickerBox(
                        bytes: _controller.image1.value.bytes,
                        width: 130,
                        height: 130,
                        imageSource: _controller.item.images[0],
                        onTap: () {
                          _controller.setImage1();
                        },
                      )),
                      Obx(() => ImagePickerBox(
                        bytes: _controller.image2.value.bytes,
                        width: 130,
                        height: 130,
                        imageSource: _controller.item.images[1],
                        onTap: () {
                          _controller.setImage2();
                        },
                      )),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: _width * 0.05),
                  child: EditItemForm(),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ));
  }
}