import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gify/controllers/add_item_page_controller.dart';
import 'package:gify/widgets/add_item_page/add_item_form.dart';
import 'package:gify/widgets/add_item_page/dotted_image_picker_box.dart';
import 'package:gify/widgets/top_nav_bar.dart';
import 'package:gify/widgets/top_nav_drawer.dart';
import 'package:google_fonts/google_fonts.dart';

class AddItemPageTabletAndMobileView extends StatelessWidget {
  static final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final AddItemPageController _controller = Get.put(AddItemPageController());
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
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
                      'Add Item',
                      style: GoogleFonts.montserrat(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: _width * 0.05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Obx(() =>
                            DottedImagePickerBox(
                              width: 130,
                              height: 130,
                              hintTextSize: 14,
                              bytes: _controller.image1.value.bytes,
                              onTap: () {
                                _controller.setImage1();
                              },
                            )),
                        Obx(() =>
                            DottedImagePickerBox(
                              width: 130,
                              height: 130,
                              hintTextSize: 14,
                              bytes: _controller.image2.value.bytes,
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
                    child: AddItemForm(),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
    );
  }
}