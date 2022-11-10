class AppExceptions implements Exception {
  final _message;
  final _prefix;

  AppExceptions(this._message, this._prefix);

  @override
  String toString() {
    return '$_prefix$_message';
  }
}

class FetchDataException extends AppExceptions {
  FetchDataException([String? message])
      : super(message, "Error During Communication");
}

class BadRequestException extends AppExceptions {
  BadRequestException([String? message])
      : super(message, "Error During Communication");
}

class UnauthorisedException extends AppExceptions {
  UnauthorisedException([String? message])
      : super(message, "Error During Communication");
}

class InvalidInputException extends AppExceptions {
  InvalidInputException([String? message])
      : super(message, "Error During Communication");
}

class NoDataException extends AppExceptions {
  NoDataException([String? message])
      : super(message, "data not get in repositry");
}
