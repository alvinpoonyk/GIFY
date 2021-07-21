import 'package:flutter/material.dart';
import 'package:gify/app.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  await Firebase.initializeApp();
  runApp(MyApp());
}
