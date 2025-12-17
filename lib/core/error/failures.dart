// core/error/failures.dart
abstract class Failure {
  String get message;  // make sure this exists
}

class ServerFailure extends Failure {
  final String errorMessage;
  ServerFailure(this.errorMessage);

  @override
  String get message => errorMessage;
}

class NetworkFailure extends Failure {
  final String errorMessage;
  NetworkFailure(this.errorMessage);

  @override
  String get message => errorMessage;
}
