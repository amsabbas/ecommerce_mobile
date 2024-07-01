

enum ErrorType {
  network,
  certificateError,
  unauthorized,
  api,
  unknown,
  parsingError
}

//ignore: must_be_immutable
class AppErrorModel implements Exception {
  String? message;
  int? code;
  ErrorType? type;

  AppErrorModel(this.message, [this.type = ErrorType.unknown, this.code = 0]);

  @override
  String toString() {
    return message.toString();
  }
}
