class ConnectionExceptions implements Exception {
  String message;

  ConnectionExceptions({this.message = 'No se obtuvo respuesta del servidor.'});
}

class TimeoutException extends ConnectionExceptions {
  TimeoutException({message}) : super();
}

class NetworkException extends ConnectionExceptions {
  NetworkException({message}) : super();
}

class BadRequestException extends ConnectionExceptions {
  BadRequestException({message}) : super();
}

class UnauthorisedException extends ConnectionExceptions {
  UnauthorisedException({message}) : super();
}

class ServerException extends ConnectionExceptions {
  ServerException({message}) : super();
}

class AppExceptions implements Exception {}

class GenericException extends AppExceptions {
  GenericException() : super();
}