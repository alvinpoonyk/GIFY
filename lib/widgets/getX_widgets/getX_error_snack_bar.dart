import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gify/constants/styles.dart';
import 'package:google_fonts/google_fonts.dart';

void getXErrorSnackBar({required String title, required String message}) {
  Get.snackbar(
    title, message,
    backgroundColor: Colors.white,
    titleText: Text(title, style: GoogleFonts.montserrat(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: kDarkGreen),
    ),
    messageText: Text(message, style: GoogleFonts.sen(
        fontSize: 12,
        color: Colors.black),
    ),
  );
}