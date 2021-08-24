class AuthException implements Exception {
  final String message;

  AuthException({required this.message});
}

class PermissionException implements Exception {
  final String message;

  PermissionException({required this.message});
}

class ImagePickException implements Exception {
  final String message;

  ImagePickException({required this.message});
}

class ImageUploadException implements Exception {
  final String message;

  ImageUploadException({required this.message});
}
