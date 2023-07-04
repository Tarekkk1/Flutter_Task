abstract class Failure {
  final String message;
  Failure({required this.message});
  @override
  String toString() {
    return message;
  }
}

class ServerFailure extends Failure {
  ServerFailure({required String message}) : super(message: message);
}

class CacheFailure extends Failure {
  CacheFailure({required String message}) : super(message: message);
}
