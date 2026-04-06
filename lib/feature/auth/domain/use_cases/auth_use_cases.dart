import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:weather_app/feature/auth/domain/repository/auth_repository.dart';

class AuthUseCase {
  final AuthRepository repo;

  AuthUseCase(this.repo);

  Future<void> signUp(
      {required String password,
      required String email,
      required String repeatPassword}) {
    return repo.signUp(email, password);
  }

  Future<void> login({required String password, required String email}) {
    return repo.signIn(email, password);
  }

  Future<void> logout() {
    return repo.signOut();
  }

  Session? getCurrentSession() {
    return repo.getCurrentSession;
  }
}
