import 'package:weather_app/core/error/failure/failure.dart';
import 'package:weather_app/core/validators/auth_validator/email_validator.dart';
import 'package:weather_app/core/validators/auth_validator/password_validator.dart';

class AuthValidator {
  static ValidationFailure? _validateCredentials(
      {required String password, required String email}) {
    final emailFailure = EmailValidator.emailValidate(email);
    if (emailFailure != null) {
      return emailFailure;
    }
    final passwordFailure = PasswordValidator.passwordValidate(password);
    if (passwordFailure != null) {
      return passwordFailure;
    }
    return null;
  }

  static ValidationFailure? signUpValidate(
      {required String email,
      required String password,
      required String repeatPassword,
      required String? context}) {
    _validateCredentials(password: password, email: email);
    if (password.trim().isEmpty) {
      return ValidationFailure('Repeat password', debugMessage: context ?? '');
    }
    if (password != repeatPassword) {
      return ValidationFailure('', debugMessage: context ?? '');
    }
    return null;
  }

  static ValidationFailure? loginValidate(
      {required String password, required String email}) {
    return _validateCredentials(password: password, email: email);
  }

  static ValidationFailure? logoutValidate(String email) {
    return EmailValidator.emailValidate(email);
  }
}
