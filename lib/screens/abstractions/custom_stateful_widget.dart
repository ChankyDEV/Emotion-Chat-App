import 'package:flutter/material.dart';

abstract class CustomState<T> extends State {
  double get screenWidth => MediaQuery.of(context).size.width;

  double get screenHeight => MediaQuery.of(context).size.height;
}
