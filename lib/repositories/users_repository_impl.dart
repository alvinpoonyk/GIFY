import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:gify/models/image_file.dart';
import 'package:gify/models/user.dart';
import 'package:gify/repositories/users_repository.dart';
import 'package:gify/services/upload_image_to_remote_db.dart';

class UsersRepositoryImpl extends UsersRepository {

  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final String userStorageURL = "gs://gify-33f30.appspot.com/users/";

  @override
  Future<void> createUser({required Map<String, dynamic> userData, required ImageFile imageFile1}) async {
    try {
      DocumentReference documentReference = _db.collection('users').doc();
      final String documentID = documentReference.id;
      final String fileName = "1";
      final bool isUploadImageSuccess = await uploadImageToRemoteDB(storageURL: userStorageURL, imageFile: imageFile1, fileName: fileName, id: documentID);
      if (isUploadImageSuccess) {
        final String downloadURL = await FirebaseStorage.instance.refFromURL("$userStorageURL/$documentID/$fileName").getDownloadURL();
        userData['profileImg'] = downloadURL;
        await documentReference.set(userData).then((value) => print("UsersRepositoryImpl: Added user to remote database"));
      }
    } catch (e) {
      print("UsersRepositoryImpl: Fail to add user to remote database");
      throw e;
    }
  }

  @override
  Future<User> getUser({required String id}) async {
    late User user;
    try {
      await _db.collection("users").doc(id).get().then((documentSnapshot) {
        user = User.fromJson(documentSnapshot.data()!);
      });
      return user;
    } catch(e) {
      print("UsersRepositoryImpl: Fail to get user from remote database");
      throw e;
    }
  }
  
}