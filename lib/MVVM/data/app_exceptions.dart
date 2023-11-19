import 'package:flutter/foundation.dart';

int i = 1;

class AppExceptions {
  final _prefix;
  final _message;
  AppExceptions([this._message, this._prefix]);

  String toString() {
    print('AppExceptions_${i++}-->$_prefix$_message');
    return '$_prefix$_message';
  }
}

class FetchDataException extends AppExceptions {
  FetchDataException([String? message])
      : super(message, 'Error During Communication');
}

class BadRequestException extends AppExceptions {
  BadRequestException([String? message]) : super(message, 'Invalid request');
}

class UnautorizedException extends AppExceptions {
  UnautorizedException([String? message])
      : super(message, 'Unauthorized request ');
}

class InvalidInputException extends AppExceptions {
  InvalidInputException([String? message]) : super(message, 'Invalid Input');
}
