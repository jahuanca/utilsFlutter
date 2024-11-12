
class ResultType<T, U>{
  get data => T;
  get error => U;
}

class Success<T,U> extends ResultType<T, U>{
  @override
  final T data;
  Success({required this.data});
}

class Error<T,U> extends ResultType<T,U>{
  @override
  final dynamic error;
  Error({this.error});
}
