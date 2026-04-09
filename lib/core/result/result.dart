import '../error/failure/failure.dart';

sealed class Result<T> {
  const Result();
}

class Ok<T> extends Result<T> {
  final T value;

  Ok(this.value);
}

class Err<T> extends Result<T> {
  final Failure failure;

  Err(this.failure);
}

typedef ResultVoid = Result<void>;

Ok<void> okVoid = Ok(null);
