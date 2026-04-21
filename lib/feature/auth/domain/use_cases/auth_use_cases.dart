import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:weather_app/core/result/result.dart';
import 'package:weather_app/feature/auth/domain/repository/auth_repository.dart';
import '../../../../core/validators/auth_validator/auth_validator.dart';

class AuthUseCase {
  final AuthRepository repo;
  final AuthValidator validator;

  AuthUseCase(this.repo, this.validator);

  Future<ResultVoid> signUp(
      {required String password,
      required String email,
      required String repeatPassword}) async {
    final validationFailure = validator.signUpValidate(
        email: email,
        password: password,
        repeatPassword: repeatPassword,
        context: 'AuthUseCase.signUp');
    if (validationFailure != null) {
      return Err(validationFailure);
    }
    return repo.signUp(email, password);
  }

  Future<ResultVoid> login(
      {required String password, required String email}) async {
    final validationFailure = validator.loginValidate(
        password: password, email: email, context: 'AuthUseCase.login');
    if (validationFailure != null) {
      return Err(validationFailure);
    }
    return repo.signIn(email, password);
  }

  Future<ResultVoid> logout() async {
    return repo.signOut();
  }

  Session? getCurrentSession() {
    return repo.getCurrentSession;
  }
}
