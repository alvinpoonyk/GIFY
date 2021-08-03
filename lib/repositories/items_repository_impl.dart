import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:gify/constants/failure_types.dart';
import 'package:gify/errors/failure.dart';
import 'package:gify/models/image_file.dart';
import 'package:gify/models/item.dart';
import 'package:gify/repositories/items_repository.dart';
import 'package:gify/services/upload_image_to_remote_db.dart';

class ItemsRepositoryImpl implements ItemsRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final String itemStorageURL = "gs://gify-33f30.appspot.com/items/";

  @override
  Future<Either<Failure,List<Item>>> getItems() async {
    try {
      List<Item> items = [];

      await _db.collection('items').where('isRemoved', isEqualTo: false).get().
      then((querySnapshot) =>
          querySnapshot.docs.forEach((documentSnapshot) {
            items.add(Item.fromJson(documentSnapshot.data()));
          }));

      print("ItemsRepositoryImpl(getItems): Successfully fetched items");

      return Right(items);
    } on SocketException {
      print("ItemsRepositoryImpl(getItems): $sockExceptionErrorMessage");
      Left(Failure(type: socketException, message: "ItemsRepositoryImpl(getItems): $sockExceptionErrorMessage"));
      rethrow;
    } on FormatException {
      print("ItemsRepositoryImpl(getItems): $formatExceptionErrorMessage");
      Left(Failure(type: formatException, message: "ItemsRepositoryImpl(getItems): $formatExceptionErrorMessage"));
      rethrow;
    }
  }

  @override
  Future<Either<Failure,List<Item>>> getItemsByCategory({required String category}) async {
    try {
      List<Item> items = [];
      await _db.collection('items').where('isRemoved', isEqualTo: false).where(
          'category', isEqualTo: category).get().
      then((querySnapshot) =>
          querySnapshot.docs.forEach((documentSnapshot) {
            items.add(Item.fromJson(documentSnapshot.data()));
          }));
      print("ItemsRepositoryImpl(getItemsByCategory): Successfully get items by category");
      return Right(items);
    } on SocketException {
      print("ItemsRepositoryImpl(getItemsByCategory): $sockExceptionErrorMessage");
      Left(Failure(type: socketException, message: sockExceptionErrorMessage));
      rethrow;
    } on FormatException {
      print("ItemsRepositoryImpl(getItemsByCategory): $formatExceptionErrorMessage");
      Left(Failure(type: formatException, message: formatExceptionErrorMessage));
      rethrow;
    }
  }

  @override
  Future<Either<Failure,List<Item>>> getItemsByLocation({required location}) async {
    try {
      List<Item> items = [];
      await _db.collection('items').where('isRemoved', isEqualTo: false).where(
          'location', isEqualTo: location).get().
      then((querySnapshot) =>
          querySnapshot.docs.forEach((documentSnapshot) {
            items.add(Item.fromJson(documentSnapshot.data()));
          }));
      print("ItemsRepositoryImpl(getItemsByLocation): Successfully get items by location");
      return Right(items);
    } on SocketException {
      print("ItemsRepositoryImpl(getItemsByLocation): $sockExceptionErrorMessage");
      Left(Failure(type: socketException, message: sockExceptionErrorMessage));
      rethrow;
    } on FormatException {
      print("ItemsRepositoryImpl(getItemsByLocation): $formatExceptionErrorMessage");
      Left(Failure(type: formatException, message: formatExceptionErrorMessage));
      rethrow;
    }
  }

  @override
  Future<Either<Failure,List<Item>>> getItemsByCategoryAndLocation(
      {required category, required location}) async {
    try {
      List<Item> items = [];
      await _db.collection('items').where('isRemoved', isEqualTo: false)
          .where('category', isEqualTo: category).where(
          'location', isEqualTo: location).get().
      then((querySnapshot) =>
          querySnapshot.docs.forEach((documentSnapshot) {
            items.add(Item.fromJson(documentSnapshot.data()));
          }));
      print("ItemsRepositoryImpl(getItemsByCategoryAndLocation): Successfully get items by category and location");
      return Right(items);
    } on SocketException {
      print("ItemsRepositoryImpl(getItemsByCategoryAndLocation): $sockExceptionErrorMessage");
      Left(Failure(type: socketException, message: sockExceptionErrorMessage));
      rethrow;
    } on FormatException {
      print("ItemsRepositoryImpl(getItemsByCategoryAndLocation): $formatExceptionErrorMessage");
      Left(Failure(type: formatException, message: formatExceptionErrorMessage));
      rethrow;
    }

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
        await documentReference.set(itemData).then((value) => print("ItemsRepositoryImpl(createItem): Added item to remote database"));
      }
    } catch (e) {
      print("ItemsRepositoryImpl(createItem): Fail to add item to remote database");
      rethrow;
    }
  }

  // @override
  // Future<List<Item>> getUserItems({required String userID}) async {
  //   try {
  //     List<Item> data = [];
  //     await _db.collection('items').where('ownerID', isEqualTo: userID).where('isRemoved').get().then(
  //             (querySnapshot) => querySnapshot.docs.forEach((documentSnapshot) {
  //           data.add(Item.fromJson(documentSnapshot.data()));
  //         }));
  //     print("ItemsRepositoryImpl(getUserItems): Successfully fetched user items");
  //     return data;
  //   } catch(e) {
  //     print("ItemsRepositoryImpl(getUserItems): ${e.toString()}");
  //     rethrow;
  //   }
  // }

  @override
  Future<Item> getItemById({required String id}) async {
    try {
      return await _db.collection('items').where('id', isEqualTo: id).where('isRemoved', isEqualTo: false).get().then((querySnapshot) {
          QueryDocumentSnapshot itemData = querySnapshot.docs.first;
          return Item.fromJson(itemData.data() as Map<String, dynamic>);
      });
    } catch(e) {
      print("ItemsRepositoryImpl(getItemById): Failed to fetch item $id, ${e.toString()}");
      rethrow;
    }
   }

  @override
  Stream<List<Item>> getUserItemsStream({required String userID}) async* {
    try {
      print("ItemsRepositoryImpl(getUserItemsStream): Stream opened");
      Stream<QuerySnapshot> source =  _db.collection('items').where('ownerID', isEqualTo: userID).where('isRemoved', isEqualTo: false).snapshots();
      await for (QuerySnapshot querySnapshot in source) {
        List<Item> items = [];
        querySnapshot.docs.forEach((documentSnapshot) {
          items.add(Item.fromJson(documentSnapshot.data() as Map<String, dynamic>));
        });
        yield items;
      }
    }
    catch(e) {
      print("ItemsRepositoryImpl(getUserItemsStream): ${e.toString()}");
      rethrow;
    }
  }

  @override
  Future<void> removeItem({required String id}) async {
    try {
      await _db.collection('items').doc(id).update({
        'isRemoved' : true,
      }).then((_) => print("ItemsRepositoryImpl(removeItem): Set isRemoved to false for item $id"));
    } catch(e) {
      print("ItemsRepositoryImpl(removeItem): ${e.toString()}");
      rethrow;
    }
  }

  @override
  Future<void> editItem({required String id, required Map<String, dynamic> itemData, ImageFile? imageFile1, ImageFile? imageFile2}) async {
    try {
      final DocumentReference documentReference = _db.collection('items').doc(id);
      /// No files to be uploaded
      if (imageFile1 == null && imageFile2 == null) {
        return await documentReference.update(itemData).then((_) => print("ItemsRepositoryImpl(editItem): item $id successfully edited"));
      }

      final String fileName1 = '1';
      final String fileName2 = '2';

      /// Replace image file 1 only
      if (imageFile1 != null && imageFile2 == null) {
        final bool isUploadImage1Success = await uploadImageToRemoteDB(id: id, fileName: fileName1, storageURL: itemStorageURL, imageFile: imageFile1);
        if (isUploadImage1Success) {
          final String downloadURL1 = await FirebaseStorage.instance.refFromURL("$itemStorageURL/$id/$fileName1").getDownloadURL();
          itemData['images'] = [downloadURL1, itemData['images'][1]];
          return await documentReference.update(itemData);
        }
      }

      /// Replace image file 2 only
      if (imageFile1 == null && imageFile2 != null) {
        final bool isUploadImage2Success = await uploadImageToRemoteDB(id: id, fileName: fileName2, storageURL: itemStorageURL, imageFile: imageFile2);
        if (isUploadImage2Success) {
          final String downloadURL2 = await FirebaseStorage.instance.refFromURL("$itemStorageURL/$id/$fileName2").getDownloadURL();
          itemData['images'] = [itemData['images'][0], downloadURL2];
          return await documentReference.update(itemData);
        }
      }

      /// Replace both image files
      final bool isUploadImage1Success = await uploadImageToRemoteDB(id: id, fileName: fileName1, storageURL: itemStorageURL, imageFile: imageFile1!);
      final bool isUploadImage2Success = await uploadImageToRemoteDB(id: id, fileName: fileName2, storageURL: itemStorageURL, imageFile: imageFile2!);
      if (isUploadImage1Success && isUploadImage2Success) {
        final String downloadURL1 = await FirebaseStorage.instance.refFromURL("$itemStorageURL/$id/$fileName1").getDownloadURL();
        final String downloadURL2 = await FirebaseStorage.instance.refFromURL("$itemStorageURL/$id/$fileName2").getDownloadURL();
        itemData['images'] = [downloadURL1, downloadURL2];
        return await documentReference.update(itemData);
      }

    } catch(e) {
      print("ItemsRepositoryImpl(editItem): ${e.toString()}");
      rethrow;
    }
  }

}