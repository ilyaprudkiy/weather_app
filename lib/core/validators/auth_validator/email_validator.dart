import 'package:weather_app/core/error/failure/failure.dart';

class EmailValidator {
  static ValidationFailure? emailValidate(String email, {String? context}) {
    final trimmedEmail = email.trim();
    if (trimmedEmail.isEmpty) {
      return ValidationFailure('The email field is empty',
          debugMessage: context ?? '');
    }
    final emailRegex = RegExp(r'^[\w\-\.]+@([\w\-]+\.)+[\w\-]{2,4}$');
    if (!emailRegex.hasMatch(trimmedEmail)) {
      return ValidationFailure('not correct email',
          debugMessage: context ?? '');
    }
    return null;
  }
}
