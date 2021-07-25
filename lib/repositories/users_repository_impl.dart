import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:gify/models/image_file.dart';
import 'package:gify/models/user.dart';
import 'package:gify/repositories/users_repository.dart';
import 'package:gify/services/upload_image_to_remote_db.dart';

class UsersRepositoryImpl extends UsersRepository {

  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final String userStorageURL = "gs://gify-33f30.appspot.com/users/";
  final String defaultProfileImage = "https://firebasestorage.googleapis.com/v0/b/gify-33f30.appspot.com/o/assets%2Fdefault_avatar.jpeg?alt=media&token=31dc001e-0c83-4e2d-a6d6-f09bd75bab30";

  @override
  Future<void> createUser({required Map<String, dynamic> userData, required ImageFile imageFile}) async {
    try {
      DocumentReference documentReference = _db.collection('users').doc();
      final String documentID = documentReference.id;
      final String fileName = "1";
      String downloadURL = defaultProfileImage;

      userData['id'] = documentID;

      if (imageFile.bytes != null && imageFile.file != null) {
        await uploadImageToRemoteDB(storageURL: userStorageURL, imageFile: imageFile, fileName: fileName, id: documentID);
        downloadURL = await FirebaseStorage.instance.refFromURL("$userStorageURL/$documentID/$fileName").getDownloadURL();
      }
      userData['profileImage'] = downloadURL;
      await documentReference.set(userData).then((value) => print("UsersRepositoryImpl(createUser): Added user to remote database"));
    } catch (e) {
      print("UsersRepositoryImpl(createUser): Failed to add user to remote database");
      rethrow;
    }
  }

  @override
  Future<User> getUser({required String email}) async {
    late User user;
    try {
      await _db.collection("users").where("email", isEqualTo: email).limit(1).get().then((querySnapshot) {
        Map<String, dynamic> userData = querySnapshot.docs.first.data();
        User fetchedUser = User.fromJson(userData);
        user = fetchedUser;
      });
      return user;
    } catch(e) {
      print("UsersRepositoryImpl: Fail to get user from remote database");
      rethrow;
    }
  }
  
}