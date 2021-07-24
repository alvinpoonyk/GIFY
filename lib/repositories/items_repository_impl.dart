import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:gify/models/image_file.dart';
import 'package:gify/models/item.dart';
import 'package:gify/repositories/items_repository.dart';
import 'package:gify/services/upload_image_to_remote_db.dart';

class ItemsRepositoryImpl implements ItemsRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final String itemStorageURL = "gs://gify-33f30.appspot.com/items/";

  @override
  Future<List<Item>> getItems() async {
    List<Item> items = [];
    await _db.collection('items').where('isRemoved', isEqualTo: false).get().
    then((querySnapshot) =>
        querySnapshot.docs.forEach((documentSnapshot) {
          items.add(Item.fromJson(documentSnapshot.data()));
        }));
    return items;
  }

  @override
  Future<List<Item>> getItemsByCategory({required String category}) async {
    List<Item> data = [];
    await _db.collection('items').where('isRemoved', isEqualTo: false).where(
        'category', isEqualTo: category).get().
    then((querySnapshot) =>
        querySnapshot.docs.forEach((documentSnapshot) {
          data.add(Item.fromJson(documentSnapshot.data()));
        }));
    return data;
  }

  @override
  Future<List<Item>> getItemsByLocation({required location}) async {
    List<Item> data = [];
    await _db.collection('items').where('isRemoved', isEqualTo: false).where(
        'location', isEqualTo: location).get().
    then((querySnapshot) =>
        querySnapshot.docs.forEach((documentSnapshot) {
          data.add(Item.fromJson(documentSnapshot.data()));
        }));
    return data;
  }

  @override
  Future<List<Item>> getItemsByCategoryAndLocation(
      {required category, required location}) async {
    List<Item> data = [];
    await _db.collection('items').where('isRemoved', isEqualTo: false)
        .where('category', isEqualTo: category).where(
        'location', isEqualTo: location).get().
    then((querySnapshot) =>
        querySnapshot.docs.forEach((documentSnapshot) {
          data.add(Item.fromJson(documentSnapshot.data()));
        }));
    return data;
  }

  @override
  Future<void> createItem({required Map<String, dynamic> itemData, required ImageFile imageFile1, required ImageFile imageFile2}) async {
    DocumentReference documentReference = _db.collection('items').doc();
    final String documentID = documentReference.id;
    try {
      final String fileName1 = "1";
      final String fileName2 = "2";
      final bool isUploadImage1Success = await uploadImageToRemoteDB(storageURL: itemStorageURL, imageFile: imageFile1, fileName: fileName1, id: documentID);
      final bool isUploadImage2Success = await uploadImageToRemoteDB(storageURL: itemStorageURL, imageFile: imageFile2, fileName: fileName2, id: documentID);
      if (isUploadImage1Success && isUploadImage2Success) {
        final String downloadURL1 = await FirebaseStorage.instance.refFromURL("$itemStorageURL/$documentID/$fileName1").getDownloadURL();
        final String downloadURL2 = await FirebaseStorage.instance.refFromURL("$itemStorageURL/$documentID/$fileName2").getDownloadURL();
        itemData['images'] = [downloadURL1, downloadURL2];
        itemData['id'] = documentID;
        await documentReference.set(itemData).then((value) => print("ItemsRepositoryImpl: Added item to remote database"));
      }
    } catch (e) {
      print("ItemsRepositoryImpl: Fail to add item to remote database");
      throw e;
    }
  }

  // Future<bool> _uploadImage({required ImageFile imageFile, required String fileName, required String id}) async {
  //   try {
  //     await FirebaseStorage.instance.refFromURL("$itemStorageURL/$id/").child(
  //         fileName).putData(imageFile.bytes, SettableMetadata(contentType: imageFile.file.mimeType)).then((_) {
  //       print("_uploadImage: Uploaded 1 image to remote storage");
  //     });
  //     return true;
  //   } catch (e) {
  //     print("_uploadImage: Failed to upload 1 image to remote storage");
  //     return false;
  //   }
  // }

}