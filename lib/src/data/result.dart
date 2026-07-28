import 'package:utils/src/data/entities/error_entity.dart';

sealed class Result<T> {
  const Result();

  factory Result.success(T value) => Success(value);

  factory Result.error(ErrorEntity error) => Error(error);
}

final class Success<T> extends Result<T> {
  const Success(this.value);

  final T value;
}

final class Error<U> extends Result<U> {
  const Error(this.error);

  final ErrorEntity error;
}
