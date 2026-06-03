sealed class Result<T,U> {
  const Result();

  factory Result.success(T value) => Success(value);

  factory Result.error(U error) => Error(error);
}

final class Success<T,U> extends Result<T,U> {
  const Success(this.value);

  final T value;
}

final class Error<T,U> extends Result<T,U> {
  const Error(this.error);

  final U error;
}
