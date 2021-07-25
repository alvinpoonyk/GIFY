import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gify/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gify/controllers/auth_controller.dart';

void main() async {
  await Firebase.initializeApp();
  Get.put(AuthController());
  runApp(MyApp());
}
