abstract class Failure {
  final String message;
  Failure({this.message = 'Something went wrong'});
}

class ServerFailure extends Failure {
  ServerFailure({String message = 'Server Failure'}) : super(message: message);
}

class CacheFailure extends Failure {
  CacheFailure({String message = 'Cache Failure'}) : super(message: message);
}

class NoInternetFailure extends Failure {
  NoInternetFailure({String message = 'No Internet Connection'})
      : super(message: message);
}

class UnauthorizedFailure extends Failure {
  UnauthorizedFailure({String message = 'Unauthorized'})
      : super(message: message);
}

class NotFoundFailure extends Failure {
  NotFoundFailure({String message = 'Not Found'}) : super(message: message);
}

class DeadlineExceededFailure extends Failure {
  DeadlineExceededFailure({String message = 'Deadline Exceeded'})
      : super(message: message);
}

class BadCertificateFailure extends Failure {
  BadCertificateFailure({String message = 'Bad Certificate'})
      : super(message: message);
}

class ConnectionFailure extends Failure {
  ConnectionFailure({String message = 'Connection Error'})
      : super(message: message);
}

class CancelFailure extends Failure {
  CancelFailure({String message = 'Cancel'}) : super(message: message);
}

class UnknownFailure extends Failure {
  UnknownFailure({String message = 'Unknown'}) : super(message: message);
}

class ModelBindingError extends Failure {
  ModelBindingError({String message = 'Model Binding Error'})
      : super(message: message);
}

class InvalidInputFailure extends Failure {
  InvalidInputFailure({String message = 'Invalid Input'})
      : super(message: message);
}

class InvalidFormatFailure extends Failure {
  InvalidFormatFailure({String message = 'Invalid Format'})
      : super(message: message);
}
