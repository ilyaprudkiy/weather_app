sealed class Failure {
  final String message;
  final String? debugMessage;

  Failure({required this.message, required this.debugMessage});
}

class ValidationFailure extends Failure {
  ValidationFailure({required super.message, required super.debugMessage});
}

class NetworkFailure extends Failure {
  NetworkFailure({required super.message, required super.debugMessage});
}

class AuthFailure extends Failure {
  AuthFailure({required super.message, required super.debugMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.message, required super.debugMessage});
}

class UnknownFailure extends Failure {
  UnknownFailure({required super.message, required super.debugMessage});
}
