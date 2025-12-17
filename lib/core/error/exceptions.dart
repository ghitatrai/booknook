// core/error/exceptions.dart
class ServerException implements Exception {
  final String message;

  ServerException(this.message);
}

class CacheException implements Exception {}

// core/error/failures.dart
