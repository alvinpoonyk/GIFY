import 'dart:typed_data';
import 'package:get/get.dart';
import 'package:gify/services/get_selected_image_bytes.dart';

class AddItemPageController extends GetxController {

  var image1Bytes = ImageBytes(null).obs;
  var image2Bytes = ImageBytes(null).obs;

  setImage1Bytes() async {
    Uint8List bytes = await getSelectedImageBytes();
    image1Bytes.value.bytes = bytes;
    image1Bytes.refresh();
  }

  setImage2Bytes() async {
    Uint8List bytes = await getSelectedImageBytes();
    image2Bytes.value.bytes = bytes;
    image2Bytes.refresh();
  }


}

class ImageBytes {
  var bytes;
  ImageBytes(this.bytes);
}