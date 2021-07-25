import 'package:gify/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepositoryImpl extends AuthRepository {

  final FirebaseAuth _authService = FirebaseAuth.instance;

  @override
  Future<void> loginUser({required String email, required String password}) async {
    try {
     await _authService.signInWithEmailAndPassword(email: email, password: password);
     print("AuthRepositoryImpl(loginUser): Successfully signed in user");
    } catch (e) {
      print("AuthRepositoryImpl(loginUser): ${e.toString()}");
      rethrow;
    }
  }

  @override
  Future<void> signUpUser({required String email, required String password}) async {
    try {
      await _authService.createUserWithEmailAndPassword(email: email, password: password);
      print("AuthRepositoryImpl(signUpUser): Successfully signed up user");
    } catch(e) {
      print("AuthRepositoryImpl(signUpUser): ${e.toString()}");
      rethrow;
    }
  }
  
}