import 'package:flutter/material.dart';
import 'package:gify/constants/filters.dart';
import 'package:gify/constants/styles.dart';
import 'package:gify/widgets/add_item_page/dotted_image_picker_box.dart';
import 'package:gify/widgets/top_nav_bar.dart';
import 'package:gify/widgets/top_nav_drawer.dart';
import 'package:google_fonts/google_fonts.dart';

class EditItemPageTabletAndMobileView extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final _formKey = GlobalKey<FormState>();
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
                      // DottedImagePickerBox(width: 130, height: 130, hintTextSize: 14),
                      // DottedImagePickerBox(width: 130, height: 130, hintTextSize: 14),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: _width * 0.05),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SelectableText(
                          'Edit Item Name',
                          style: GoogleFonts.montserrat(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: 500,
                          child: TextFormField(
                            cursorColor: kLightGreen,
                            decoration: InputDecoration(
                              focusedBorder: const OutlineInputBorder(
                                borderRadius: const BorderRadius.all(Radius.circular(10)),
                                borderSide: const BorderSide(color: kLightGreen, width: 1),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderRadius: const BorderRadius.all(Radius.circular(10)),
                                borderSide: const BorderSide(color: kLightGreen, width: 1),
                              ),
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              contentPadding: const EdgeInsets.only(
                                  left: 15, bottom: 11, top: 11, right: 15),
                              hintText: "Name of your item",
                              hintStyle: GoogleFonts.roboto(
                                fontSize: 16,
                                color: kDarkGreen,
                              ),
                            ),
                          ),
                        ),
                        ///
                        const SizedBox(height: 20),
                        ///
                        SelectableText(
                          'Location',
                          style: GoogleFonts.montserrat(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          padding: const EdgeInsets.fromLTRB(10,0,10,0),
                          decoration: const ShapeDecoration(
                            shape: const RoundedRectangleBorder(
                                side: const BorderSide(
                                    width: 1, style: BorderStyle.solid, color: kLightGreen),
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(10),
                                )),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              icon: const Icon(
                                Icons.arrow_drop_down_sharp,
                                color: kDarkGreen,
                              ),
                              iconSize: 30,
                              onChanged: (value) {},
                              hint: Text('Select Location',
                                style: GoogleFonts.sen(
                                    fontSize: 16, color: kDarkGreen),
                              ),
                              items: kLocations.map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: GoogleFonts.sen(
                                        fontSize: 16, color: kDarkGreen),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        ///
                        SelectableText(
                          'Category',
                          style: GoogleFonts.montserrat(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        SizedBox(height: 10),
                        Container(
                          padding: const EdgeInsets.fromLTRB(10,0,10,0),
                          decoration: const ShapeDecoration(
                            shape: const RoundedRectangleBorder(
                                side: const BorderSide(
                                    width: 1, style: BorderStyle.solid, color: kLightGreen),
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(10),
                                )),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              icon: const Icon(
                                Icons.arrow_drop_down_sharp,
                                color: kDarkGreen,
                              ),
                              iconSize: 30,
                              onChanged: (value) {},
                              hint: Text('Select Category',
                                style: GoogleFonts.sen(
                                    fontSize: 16, color: kDarkGreen),
                              ),
                              items: kCategories.map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: GoogleFonts.sen(
                                        fontSize: 16, color: kDarkGreen),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        ///
                        SelectableText(
                          'Availability',
                          style: GoogleFonts.montserrat(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: 500,
                          child: TextFormField(
                            cursorColor: kLightGreen,
                            decoration: InputDecoration(
                              focusedBorder: const OutlineInputBorder(
                                borderRadius: const BorderRadius.all(Radius.circular(10)),
                                borderSide: const BorderSide(color: kDarkGreen, width: 1),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderRadius: const BorderRadius.all(Radius.circular(10)),
                                borderSide: const BorderSide(color: kLightGreen, width: 1),
                              ),
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              contentPadding: const EdgeInsets.only(
                                  left: 15, bottom: 11, top: 11, right: 15),
                              hintText: "Convenient meeting time",
                              hintStyle: GoogleFonts.roboto(
                                fontSize: 16,
                                color: kDarkGreen,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        ///
                        SelectableText(
                          'Edit Item Description',
                          style: GoogleFonts.montserrat(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: 600,
                          child: TextFormField(
                            maxLines: 6,
                            minLines: 6,
                            cursorColor: kLightGreen,
                            decoration: InputDecoration(
                              focusedBorder: const OutlineInputBorder(
                                borderRadius: const BorderRadius.all(Radius.circular(10)),
                                borderSide: const BorderSide(color: kDarkGreen, width: 1),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderRadius: const BorderRadius.all(Radius.circular(10)),
                                borderSide: const BorderSide(color: kLightGreen, width: 1),
                              ),
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              contentPadding: const EdgeInsets.only(
                                  left: 15, bottom: 11, top: 11, right: 15),
                              hintText: "Description about the item",
                              hintStyle: GoogleFonts.roboto(
                                fontSize: 16,
                                color: kDarkGreen,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        ///
                        const SizedBox(height: 5),
                        ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty.all<Color>(kDarkGreen),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ))),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // // If the form is valid, display a snackbar. In the real world,
                              // // you'd often call a server or save the information in a database.
                              // ScaffoldMessenger.of(context)
                              //     .showSnackBar(SnackBar(content: Text('Processing Data')));
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Center(
                              child: Text(
                                'Update',
                                style: GoogleFonts.sen(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        ///
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ));
  }
}