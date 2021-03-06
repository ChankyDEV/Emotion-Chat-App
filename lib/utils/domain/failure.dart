import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class Failure extends Equatable {
  final String message;

  Failure({required this.message});

  @override
  List<Object> get props => [message];
}
