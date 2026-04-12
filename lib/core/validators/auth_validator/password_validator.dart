import 'package:weather_app/core/error/failure/failure.dart';

class PasswordValidator {
  static ValidationFailure? passwordValidate(String password,
      {String? context}) {
    if (password.isEmpty) {
      return ValidationFailure('The password field is empty',
          debugMessage: context ?? '');
    }
    if (password.length < 8) {
      return ValidationFailure('Password must contain at least 8 characters',
          debugMessage: context ?? '');
    }
    final hasLoverCase = RegExp(r'[a-z]');
    if (!hasLoverCase.hasMatch(password)) {
      return ValidationFailure(
          'Password must contain at least one lowercase letter',
          debugMessage: context ?? '');
    }
    final hasUpperCase = RegExp(r'[A-Z]');
    if (!hasUpperCase.hasMatch(password)) {
      return ValidationFailure(
          'Password must contain at least one uppercase letter',
          debugMessage: context ?? '');
    }
    final hasDigit = RegExp(r'[0-9]');
    if (!hasDigit.hasMatch(password)) {
      return ValidationFailure('Password must contain at least one digit',
          debugMessage: context ?? '');
    }
    final hasSpecial = RegExp(r'[!@#$%^&*(),.?":{}|<>]');
    if (!hasSpecial.hasMatch(password)) {
      return ValidationFailure(
          'Password must contain at least one special character',
          debugMessage: context ?? '');
    }
    return null;
  }
}
