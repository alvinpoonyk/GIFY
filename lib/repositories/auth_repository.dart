abstract class AuthRepository {
  Future<void> signUpUser({required String email, required String password});
  Future<void> loginUser({required String email, required String password});
  Future<void> logOut();
}