import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gify/constants/styles.dart';
import 'package:gify/controllers/explore_page_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryDropdownButton extends StatefulWidget {
  final String hintText;
  final List<String> items;

  CategoryDropdownButton({
    Key? key,
    required this.items,
    required this.hintText,
  }) : super(key: key);

  @override
  _CategoryDropdownButtonState createState() => _CategoryDropdownButtonState();
}

class _CategoryDropdownButtonState extends State<CategoryDropdownButton> {
  final ExplorePageController _controller = Get.find();
  late String selectedCategory;

  @override
  void initState() {
    selectedCategory = widget.hintText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return DropdownButtonHideUnderline(
      child: Container(
        padding: width > 768
            ? EdgeInsets.fromLTRB(20, 0, 10, 0)
            : EdgeInsets.fromLTRB(10, 0, 5, 0),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
              side: BorderSide(
                  width: 1, style: BorderStyle.solid, color: kDarkGreen),
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              )),
        ),
        child: DropdownButton<String>(
          icon: Icon(
            Icons.arrow_drop_down_sharp,
            color: kDarkGreen,
          ),
          iconSize: width > 768 ? 30 : 20,
          onChanged: (value) async {
            if (value != null) {
              await _controller.getItemsByCategory(selectedCategory: value).then((_) {
                setState(() {
                  selectedCategory = value;
                });
              });
            }
          },
          hint: Text(
            selectedCategory,
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