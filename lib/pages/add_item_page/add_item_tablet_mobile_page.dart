import 'package:flutter/material.dart';
import 'package:gify/widgets/add_item_page/add_item_form.dart';
import 'package:gify/widgets/add_item_page/dotted_image_picker_box.dart';
import 'package:gify/widgets/top_nav_bar.dart';
import 'package:gify/widgets/top_nav_drawer.dart';
import 'package:google_fonts/google_fonts.dart';

class AddItemPageTabletAndMobileView extends StatelessWidget {
  static final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
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
            drawer: TopNavDrawer(),
            key: _scaffoldKey,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  navigationBar(screenWidth: _width, scaffoldKey: _scaffoldKey),
                  SizedBox(height: 10),
                  Center(
                    child: SelectableText(
                      'Add Item',
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
                        DottedImagePickerBox(width: 130, height: 130, hintTextSize: 14),
                        DottedImagePickerBox(width: 130, height: 130, hintTextSize: 14),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: _width * 0.05),
                    child: AddItemForm(),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
    );
  }
}