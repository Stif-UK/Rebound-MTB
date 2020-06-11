class AppException implements Exception{
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  String toString(){
    return "$_prefix$_message";
  }

}

class FetchDataException extends AppException{
  FetchDataException([message]) : super(message, "Error During Communication: ");
}

class BadRequestException extends AppException{
  BadRequestException([message]) : super(message, "Bad Request: ");
}

class UnauthorisedException extends AppException{
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
}

class NotFoundException extends AppException{
  NotFoundException([message]) : super(message, "Not Found: ");
}

class TooManyRequestsException extends AppException{
  TooManyRequestsException([message]) : super(message, "Too Many Requests: ");
}

