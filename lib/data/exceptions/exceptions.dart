abstract class ExceptionWithMessage implements Exception {
  final String message;

  ExceptionWithMessage({required this.message});
}

class AuthException extends ExceptionWithMessage {
  AuthException({required String message}) : super(message: message);
}

class PermissionException extends ExceptionWithMessage {
  PermissionException({required String message}) : super(message: message);
}

class ImagePickException extends ExceptionWithMessage {
  ImagePickException({required String message}) : super(message: message);
}

class ImageUploadException extends ExceptionWithMessage {
  ImageUploadException({required String message}) : super(message: message);
}

class NoUserWithEmailException extends ExceptionWithMessage {
  NoUserWithEmailException({required String message}) : super(message: message);
}

class DatabaseException extends ExceptionWithMessage {
  DatabaseException({required String message}) : super(message: message);
}

class InvitationException extends ExceptionWithMessage {
  InvitationException({required String message}) : super(message: message);
}
