import 'package:flutter/material.dart';
import 'package:gify/constants/filters.dart';
import 'package:gify/constants/styles.dart';
import 'package:gify/widgets/add_item_page/dotted_image_picker_box.dart';
import 'package:gify/widgets/top_nav_bar.dart';
import 'package:gify/widgets/top_nav_drawer.dart';
import 'package:google_fonts/google_fonts.dart';

class AddItemPageWebView extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return SafeArea(
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
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              SizedBox(height: 10),
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
                            DottedImagePickerBox(
                              width: 500,
                              height: 300,
                            ),
                            SizedBox(height: 20),
                            DottedImagePickerBox(
                              width: 500,
                              height: 300,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0,20,20,20),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SelectableText(
                                'Add Item',
                                style: GoogleFonts.montserrat(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              SizedBox(height: 10),
                              SizedBox(
                                width: 500,
                                child: TextFormField(
                                  cursorColor: kLightGreen,
                                  decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                      borderSide: BorderSide(color: kLightGreen, width: 1),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                      borderSide: BorderSide(color: kLightGreen, width: 1),
                                    ),
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    contentPadding: EdgeInsets.only(
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
                              SizedBox(height: 20),
                              ///
                              SelectableText(
                                'Location',
                                style: GoogleFonts.montserrat(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              SizedBox(height: 10),
                              Container(
                                padding: const EdgeInsets.fromLTRB(10,0,10,0),
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          width: 1, style: BorderStyle.solid, color: kLightGreen),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      )),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    icon: Icon(
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
                              SizedBox(height: 20),
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
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          width: 1, style: BorderStyle.solid, color: kLightGreen),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      )),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    icon: Icon(
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
                              SizedBox(height: 20),
                              ///
                              SelectableText(
                                'Availability',
                                style: GoogleFonts.montserrat(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              SizedBox(height: 10),
                              SizedBox(
                                width: 500,
                                child: TextFormField(
                                  cursorColor: kLightGreen,
                                  decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                      borderSide: BorderSide(color: kDarkGreen, width: 1),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                      borderSide: BorderSide(color: kLightGreen, width: 1),
                                    ),
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    contentPadding: EdgeInsets.only(
                                        left: 15, bottom: 11, top: 11, right: 15),
                                    hintText: "Convenient meeting time",
                                    hintStyle: GoogleFonts.roboto(
                                      fontSize: 16,
                                      color: kDarkGreen,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              ///
                              SelectableText(
                                'Item Description',
                                style: GoogleFonts.montserrat(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              SizedBox(height: 10),
                              SizedBox(
                                width: 600,
                                child: TextFormField(
                                  maxLines: 6,
                                  minLines: 6,
                                  cursorColor: kLightGreen,
                                  decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                      borderSide: BorderSide(color: kDarkGreen, width: 1),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                      borderSide: BorderSide(color: kLightGreen, width: 1),
                                    ),
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    contentPadding: EdgeInsets.only(
                                        left: 15, bottom: 11, top: 11, right: 15),
                                    hintText: "Description about the item",
                                    hintStyle: GoogleFonts.roboto(
                                      fontSize: 16,
                                      color: kDarkGreen,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              ///
                              SizedBox(height: 5),
                              SizedBox(
                                width: 250,
                                child: ElevatedButton(
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
                                        'Submit',
                                        style: GoogleFonts.sen(
                                          fontSize: 18,
                                          color: Colors.white,
                                        ),
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