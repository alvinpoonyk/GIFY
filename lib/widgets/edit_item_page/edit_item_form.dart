import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gify/constants/styles.dart';
import 'package:gify/controllers/edit_item_page_controller.dart';
import 'package:gify/validators/form_validators.dart';
import 'package:google_fonts/google_fonts.dart';

class EditItemForm extends StatefulWidget {

  @override
  _EditItemFormState createState() => _EditItemFormState();
}

class _EditItemFormState extends State<EditItemForm> {

  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final EditItemPageController _controller = Get.find();

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
            'Edit Name',
            style: GoogleFonts.montserrat(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: 500,
            child: TextFormField(
              controller: _controller.itemNameController,
              validator: (value) => isStringEmpty(value: value, errorMessage: 'Item name cannot be empty'),
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
                onChanged: (value) => _controller.setLocation(value: value!),
                hint: Obx(() => Text(_controller.location.value,
                  style: GoogleFonts.sen(
                      fontSize: 16, color: kDarkGreen),
                )),
                items: _controller.locationOptions.map<DropdownMenuItem<String>>((String value) {
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
                onChanged: (value) => _controller.setCategory(value: value!),
                hint: Obx(() => Text(_controller.category.value,
                  style: GoogleFonts.sen(
                      fontSize: 16, color: kDarkGreen),
                )),
                items: _controller.categoryOptions.map<DropdownMenuItem<String>>((String value) {
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
              controller: _controller.availabilityController,
              validator: (value) => isStringEmpty(value: value, errorMessage: 'Availability cannot be empty'),
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
            'Edit description',
            style: GoogleFonts.montserrat(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: 600,
            child: TextFormField(
              controller: _controller.descriptionController,
              validator: (value) => isStringEmpty(value: value, errorMessage: 'Description cannot be empty'),
              maxLines: 6,
              minLines: 6,
              cursorColor: kLightGreen,
              decoration:  InputDecoration(
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
            width: _width > 768 ? 250 : _width,
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
                  await _controller.editItemInRemoteDatabase();
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
          ),
          ///
        ],
      ),
    );
  }
}