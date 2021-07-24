import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gify/controllers/sign_up_page_controller.dart';

class ImagePickerCircleAvatar extends StatelessWidget {
  final Uint8List? bytes;
  const ImagePickerCircleAvatar({Key? key, this.bytes,}) : super(key: key);
  @override

  Widget build(BuildContext context) {
    final SignUpPageController _controller = Get.find();
    return InkWell(
      borderRadius: BorderRadius.all(Radius.circular(90)),
      onTap: () async {
        await _controller.setUserImage();
      },
      child: bytes != null ? ClipOval(
        child: Image.memory(_controller.userImage.value.bytes, width: 160, height: 160),
      ) :
      CircleAvatar(
        backgroundImage: NetworkImage("https://picsum.photos/200/300"),
        minRadius: 80,
        maxRadius: 80,
      ),
    );
  }
}