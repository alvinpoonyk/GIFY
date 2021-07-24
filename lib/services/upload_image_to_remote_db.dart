import 'package:firebase_storage/firebase_storage.dart';
import 'package:gify/models/image_file.dart';

Future<bool> uploadImageToRemoteDB({required ImageFile imageFile, required String storageURL, required String fileName, required String id}) async {
  try {
    await FirebaseStorage.instance.refFromURL("$storageURL/$id/").child(
        fileName).putData(imageFile.bytes, SettableMetadata(contentType: imageFile.file.mimeType)).then((_) {
      print("uploadSingleImage: Uploaded 1 image to remote storage");
    });
    return true;
  } catch (e) {
    print("uploadSingleImage: Failed to upload 1 image to remote storage");
    return false;
  }
}