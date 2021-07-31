import 'dart:typed_data';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:gify/constants/styles.dart';

class ImagePickerBox extends StatelessWidget {
  final double width;
  final double height;
  final double? hintTextSize;
  final String imageSource;
  final Function onTap;
  final Uint8List? bytes;
  const ImagePickerBox({Key? key, this.bytes, required this.width, required this.height, this.hintTextSize, required this.imageSource, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap.call(),
      child: DottedBorder(
        color: kDarkGreen,
        strokeWidth: 1,
        child: SizedBox(
          width: width,
          height: height,
          child: bytes == null ? Image.network(imageSource) : Image.memory(bytes!),
        ),
      ),
    );
  }
}