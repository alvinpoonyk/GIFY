import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gify/controllers/edit_item_page_controller.dart';
import 'package:gify/widgets/edit_item_page/edit_item_form.dart';
import 'package:gify/widgets/edit_item_page/image_picker_box.dart';
import 'package:gify/widgets/top_nav_bar.dart';
import 'package:gify/widgets/top_nav_drawer.dart';
import 'package:google_fonts/google_fonts.dart';

class EditItemPageWebView extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
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
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: _width * 0.05),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Obx(() =>ImagePickerBox(
                              bytes: _controller.image1.value.bytes,
                              width: 500,
                              height: 300,
                              imageSource: _controller.item.images[0],
                              onTap: () {
                                _controller.setImage1();
                              },
                            )),
                            SizedBox(height: 20),
                            Obx(() =>ImagePickerBox(
                              bytes: _controller.image2.value.bytes,
                              width: 500,
                              height: 300,
                              imageSource: _controller.item.images[1],
                              onTap: () {
                                _controller.setImage2();
                              },
                            )),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0,20,20,20),
                        child: EditItemForm(),
                      ),
                    )
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