import '../../data/auth_data_provider.dart';

abstract class AuthRepository {
  Future<void> signIn(String email, String password);

  Future<void> signUp(String email, String password);

  Future<void> signOut();
}

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataProvider _authDataProvider;

  AuthRepositoryImpl({required AuthDataProvider authDataProvider})
      : _authDataProvider = authDataProvider;

  @override
  Future<void> signIn(String email, String password) async {
    await _authDataProvider.authUserWithPassword(password, email);
  }

  @override
  Future<void> signUp(String email, String password) async {
    await _authDataProvider.registeredUserWithEmail(password, email);
  }

  @override
  Future<void> signOut() async {
    await _authDataProvider.signOut();
  }
}
