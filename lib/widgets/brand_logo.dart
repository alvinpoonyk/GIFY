import 'package:flutter/material.dart';
import 'package:gify/constants/styles.dart';
import 'package:google_fonts/google_fonts.dart';

class BrandLogo extends StatelessWidget {
  final double fontSize;
  final double iconSize;

  const BrandLogo({Key? key, required this.fontSize, required this.iconSize}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.spa, size: iconSize, color: kLightGreen),
        const SizedBox(width: 10),
        TextButton(
          onPressed: () => {},
          child: Text(
            'GIFY',
            style: GoogleFonts.sen(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
        ),
      ],
    );
  }
}