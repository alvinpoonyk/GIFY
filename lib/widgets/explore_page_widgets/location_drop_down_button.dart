import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gify/constants/styles.dart';
import 'package:gify/controllers/explore_page_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class LocationDropdownButton extends StatefulWidget {
  final String hintText;
  final List<String> items;

  LocationDropdownButton({
    Key? key,
    required this.items,
    required this.hintText,
  }) : super(key: key);

  @override
  _LocationDropdownButtonState createState() => _LocationDropdownButtonState();
}

class _LocationDropdownButtonState extends State<LocationDropdownButton> {
  final ExplorePageController _controller = Get.find();

  late String selectedLocation;

  @override
  void initState() {
    selectedLocation = widget.hintText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return DropdownButtonHideUnderline(
      child: Container(
        padding: width > 768
            ? const EdgeInsets.fromLTRB(20, 0, 10, 0)
            : const EdgeInsets.fromLTRB(10, 0, 5, 0),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
              side: BorderSide(
                  width: 1, style: BorderStyle.solid, color: kDarkGreen),
              borderRadius: const BorderRadius.all(
                const Radius.circular(30),
              )),
        ),
        child: DropdownButton<String>(
          icon: const Icon(
            Icons.arrow_drop_down_sharp,
            color: kDarkGreen,
          ),
          iconSize: width > 768 ? 30 : 20,
          onChanged: (value) async {
            if (value != null) {
              await _controller.getItemsByLocation(selectedLocation: value).then((_) {
                setState(() {
                  selectedLocation = value;
                });
              });
            }
          },
          hint: Text(
            selectedLocation,
            style: GoogleFonts.sen(
                fontSize: width > 768 ? 20 : 14, color: kDarkGreen),
          ),
          items: widget.items.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: GoogleFonts.sen(
                    fontSize: width > 768 ? 20 : 14, color: kDarkGreen),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}