import 'package:weather_app/core/error/failure/failure.dart';
import 'package:weather_app/core/validators/auth_validator/email_validator.dart';
import 'package:weather_app/core/validators/auth_validator/password_validator.dart';

class AuthValidator {
  ValidationFailure? _validateCredentials(
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

  ValidationFailure? signUpValidate(
      {required String email,
      required String password,
      required String repeatPassword,
      required String? context}) {
    final failure = _validateCredentials(password: password, email: email);
    if (failure != null) {
      return failure;
    }
    if (password.trim().isEmpty) {
      return ValidationFailure('fill in the password field',
          debugMessage: context ?? '');
    }
    if (repeatPassword.trim().isEmpty) {
      return ValidationFailure('Repeat password', debugMessage: context ?? '');
    }
    if (password != repeatPassword) {
      return ValidationFailure('Passwords do not match',
          debugMessage: context ?? '');
    }
    return null;
  }

  ValidationFailure? loginValidate(
      {required String password,
      required String email,
      required String? context}) {
    return _validateCredentials(password: password, email: email);
  }

  ValidationFailure? logoutValidate(String email) {
    return EmailValidator.emailValidate(email);
  }
}
