import 'package:flutter/material.dart';
import 'package:gify/constants/styles.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDropdownButton extends StatelessWidget {
  final double width;
  final String hintText;
  final List<String> items;
  const CustomDropdownButton({
    Key? key,
    required this.items,
    required this.width,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          onChanged: (value) {},
          hint: Text(
            hintText,
            style: GoogleFonts.sen(
                fontSize: width > 768 ? 20 : 14, color: kDarkGreen),
          ),
          items: items.map<DropdownMenuItem<String>>((String value) {
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