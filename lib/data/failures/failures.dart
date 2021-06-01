import 'package:emotion_chat/constants/data.dart';
import 'package:flutter/material.dart';

class AuthFailure extends Failure {
  AuthFailure({required String message}) : super(message: message);
}

class ConversationFailure extends Failure {
  ConversationFailure(String message) : super(message: message);
}

class DatabaseFailure extends Failure {
  DatabaseFailure(String message) : super(message: message);
}

class ImageFailure extends Failure {
  ImageFailure(String message) : super(message: message);
}

class ImagePickFailure extends Failure {
  ImagePickFailure(String message) : super(message: message);
}

class NetworkFailure extends Failure {
  NetworkFailure({required String message}) : super(message: message);
}
