import 'dart:typed_data';
import 'package:gify/models/image_file.dart';
import 'package:image_picker/image_picker.dart';

Future<ImageFile> getSelectedImageFile() async {
  final ImagePicker picker = ImagePicker();
  final XFile? image = await picker.pickImage(source: ImageSource.gallery);
  final Uint8List bytes = await image!.readAsBytes();
  return ImageFile(image,bytes);
}

