import 'package:gify/models/image_file.dart';
import 'package:gify/models/user.dart';

abstract class UsersRepository {

  Future<User> getUser({required String id});
  Future<void> createUser({required Map<String, dynamic> userData, required ImageFile imageFile1});

}