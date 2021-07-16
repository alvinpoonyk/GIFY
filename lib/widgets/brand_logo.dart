import 'package:flutter/material.dart';
import 'package:gify/constants/styles.dart';
import 'package:google_fonts/google_fonts.dart';

Widget brandLogo({required double fontSize, required double iconSize}) => Row(
      children: [
        Icon(Icons.spa, size: iconSize, color: kLightGreen),
        const SizedBox(width: 10),
        TextButton(
          onPressed: () {},
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