import 'package:flutter/material.dart';
import 'package:gify/constants/styles.dart';

Widget centerCircularProgressIndicator({Color? color}) => Center(
  child: CircularProgressIndicator(
    color: color ?? kLightGreen,
  ),
);