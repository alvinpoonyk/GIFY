import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:gify/constants/styles.dart';
import 'package:google_fonts/google_fonts.dart';

class DottedImagePickerBox extends StatelessWidget {
  final double width;
  final double height;
  final double? hintTextSize;
  const DottedImagePickerBox({Key? key, required this.width, required this.height, this.hintTextSize,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: DottedBorder(
        color: kDarkGreen,
        strokeWidth: 1,
        child: SizedBox(
          width: width,
          height: height,
          child: Center(
            child: Text(
              'Click to add an image',
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                  fontSize: hintTextSize ?? 18,
                  color: kLightGreen),
            ),
          ),
        ),
      ),
    );
  }
}