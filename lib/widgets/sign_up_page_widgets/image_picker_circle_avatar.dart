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
        backgroundImage: NetworkImage("https://firebasestorage.googleapis.com/v0/b/gify-33f30.appspot.com/o/assets%2Fdefault_avatar.jpeg?alt=media&token=31dc001e-0c83-4e2d-a6d6-f09bd75bab30"),
        minRadius: 80,
        maxRadius: 80,
      ),
    );
  }
}