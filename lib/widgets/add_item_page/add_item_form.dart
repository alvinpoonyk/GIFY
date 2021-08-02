import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gify/constants/filters.dart';
import 'package:gify/constants/styles.dart';
import 'package:gify/controllers/add_item_page_controller.dart';
import 'package:gify/controllers/auth_controller.dart';
import 'package:gify/validators/form_validators.dart';
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

    double _width = MediaQuery.of(context).size.width;

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
          const SizedBox(height: 10),
          SizedBox(
            width: 500,
            child: TextFormField(
              controller: _controller.nameTextController,
              validator: (value) => isStringEmpty(value: value!, errorMessage: 'Please enter an item name'),
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
            decoration: ShapeDecoration(
              shape: const RoundedRectangleBorder(
                  side: const BorderSide(
                      width: 1, style: BorderStyle.solid, color: kLightGreen),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  )),
            ),
            child: SizedBox(
              width: 180,
              child: DropdownButtonHideUnderline(
                child: DropdownButtonFormField<String>(
                  onChanged: (value) => _controller.setSelectedLocation(value: value!),
                  validator: (value) => isStringEmpty(value: value, errorMessage: 'Please select a location'),
                  icon: const Icon(
                    Icons.arrow_drop_down_sharp,
                    color: kDarkGreen,
                  ),
                  iconSize: 30,
                  hint: Obx(() => Text(_controller.selectedLocation.value,
                    style: GoogleFonts.sen(
                        fontSize: 16, color: kDarkGreen),
                  )),
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
          const SizedBox(height: 20),
          ///
          SelectableText(
            'Category',
            style: GoogleFonts.montserrat(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.fromLTRB(10,0,10,0),
            decoration: ShapeDecoration(
              shape: const RoundedRectangleBorder(
                  side: const BorderSide(
                      width: 1, style: BorderStyle.solid, color: kLightGreen),
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(10),
                  )),
            ),
            child: SizedBox(
              width: 180,
              child: DropdownButtonHideUnderline(
                child: DropdownButtonFormField<String>(
                  onChanged: (value) => _controller.setSelectedCategory(value: value!),
                  validator: (value) => isStringEmpty(value: value, errorMessage: 'Please select a category'),
                  icon: const Icon(
                    Icons.arrow_drop_down_sharp,
                    color: kDarkGreen,
                  ),
                  iconSize: 30,
                  hint: Obx(() => Text(_controller.selectedCategory.value,
                    style: GoogleFonts.sen(
                        fontSize: 16, color: kDarkGreen),
                  )),
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
              controller: _controller.availabilityTextController,
              validator: (value) => isStringEmpty(value: value, errorMessage: 'Please enter a convenient meeting time'),
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
            'Item Description',
            style: GoogleFonts.montserrat(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: 600,
            child: TextFormField(
              controller: _controller.descriptionTextController,
              validator: (value) => isStringEmpty(value: value, errorMessage: 'Please enter a description'),
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
          const SizedBox(height: 25),
          ///
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
                      name: _controller.nameTextController.text.trim(),
                      ownerID: _authController.getCurrentUserID(),
                      location: _controller.selectedLocation.value,
                      category: _controller.selectedCategory.value,
                      description: _controller.descriptionTextController.text.trim(),
                      availability: _controller.availabilityTextController.text.trim());
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