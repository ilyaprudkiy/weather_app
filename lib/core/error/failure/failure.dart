sealed class Failure {
  final String message;
  final String? debugMessage;

  const Failure(this.message, {this.debugMessage});
}

class ValidationFailure extends Failure {
 const  ValidationFailure(super.message, {super.debugMessage});
}

class NetworkFailure extends Failure {
 const  NetworkFailure(super.message, {super.debugMessage});
}

class AuthFailure extends Failure {
 const  AuthFailure(super.message, {super.debugMessage});
}

class ServerFailure extends Failure {
const   ServerFailure(super.message, {super.debugMessage});
}

class UnknownFailure extends Failure {
 const  UnknownFailure(super.message, {super.debugMessage});
}
