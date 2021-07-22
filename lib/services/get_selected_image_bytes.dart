// import 'dart:html';
// import 'package:firebase_storage/firebase_storage.dart';
//
// /// Function to select and upload file image for web using Dart's native HTML library
// uploadImageFile() async {
//   /// FileUploadInputElement object allows to access the HTML file input element
//   FileUploadInputElement uploadInput = FileUploadInputElement();
//   /// Set the only acceptable files are image formats
//   uploadInput.accept = "image/*";
//   /// Opens up the file selector window
//   uploadInput.click();
//   /// Create listener to listen to change in the file input element
//   uploadInput.addEventListener('change', (event) async {
//     /// Saves the selected file into the file variable
//     final File file = uploadInput.files!.first;
//     /// A file reader object allows the web application to asynchronously read the contents of a file that is stored in the user computer
//     final FileReader reader = FileReader();
//     /// Reads the selected file as a URL
//     reader.readAsDataUrl(file);
//     /// Console log results
//     reader.onLoadEnd.first.then((_) => reader.result.toString());
//     /// ----------- ///
//     await FirebaseStorage.instance.refFromURL("gs://gify-33f30.appspot.com/items").child('alvin').putBlob(file).then((_) {
//       print('success!');
//     });
//   });
// }

import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';

getSelectedImageBytes() async {
  final ImagePicker picker = ImagePicker();
  XFile? image = await picker.pickImage(source: ImageSource.gallery);
  Uint8List bytes = await image!.readAsBytes();
  return bytes;
}