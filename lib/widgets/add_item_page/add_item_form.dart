import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gify/constants/filters.dart';
import 'package:gify/constants/styles.dart';
import 'package:gify/controllers/add_item_page_controller.dart';
import 'package:gify/controllers/auth_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class AddItemForm extends StatefulWidget {


  @override
  _AddItemFormState createState() => _AddItemFormState();
}

class _AddItemFormState extends State<AddItemForm> {

  final _formKey = GlobalKey<FormState>();
  final List<String> _locationOptions = [... kLocations];
  final List<String> _categoryOptions = [... kCategories];
  final AddItemPageController _controller = Get.find();
  final AuthController _authController = Get.find();

  @override
  Widget build(BuildContext context) {

    String? _name;
    String? _location;
    String? _category;
    String? _availability;
    String? _description;

    double _width = MediaQuery.of(context).size.width;
    _locationOptions.removeAt(0);
    _categoryOptions.removeAt(0);
    return Form(
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
              onChanged: (value) {
                _name = value.trim();
              },
              validator: (value) {
                if (value!.trim().isEmpty)
                  return 'Please enter an item name';
                return null;
              },
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
            child: SizedBox(
              width: 180,
              child: DropdownButtonHideUnderline(
                child: DropdownButtonFormField<String>(
                  onChanged: (value) {
                    _location = value!.trim();
                  },
                  validator: (value) {
                    if (value == null)
                      return 'Please select a location';
                    return null;
                  },
                  icon: Icon(
                    Icons.arrow_drop_down_sharp,
                    color: kDarkGreen,
                  ),
                  iconSize: 30,
                  hint: Text('Select Location',
                    style: GoogleFonts.sen(
                        fontSize: 16, color: kDarkGreen),
                  ),
                  items: _locationOptions.map<DropdownMenuItem<String>>((String value) {
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
            child: SizedBox(
              width: 180,
              child: DropdownButtonHideUnderline(
                child: DropdownButtonFormField<String>(
                  onChanged: (value) {
                    _category = value!.trim();
                  },
                  validator: (value) {
                    if (value == null)
                      return 'Please select a category';
                    return null;
                  },
                  icon: Icon(
                    Icons.arrow_drop_down_sharp,
                    color: kDarkGreen,
                  ),
                  iconSize: 30,
                  hint: Text('Select Category',
                    style: GoogleFonts.sen(
                        fontSize: 16, color: kDarkGreen),
                  ),
                  items: _categoryOptions.map<DropdownMenuItem<String>>((String value) {
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
              onChanged: (value) {
                _availability = value.trim();
              },
              validator: (value) {
                if (value!.isEmpty)
                  return 'Please enter a convenient meeting time';
                return null;
              },
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
              onChanged: (value) {
                _description = value.trim();
              },
              validator: (value) {
                if (value!.isEmpty)
                  return 'Please enter an item description';
                return null;
              },
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
            width: _width <= 768 ? _width * 0.9 : 250,
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(kDarkGreen),
                  shape: MaterialStateProperty.all<
                      RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ))),
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  await _controller.storeItemInRemoteDatabase(
                      name: _name!,
                      ownerID: _authController.getCurrentUserID(),
                      location: _location!,
                      category: _category!,
                      description: _description!,
                      availability: _availability!);
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
    );
  }
}