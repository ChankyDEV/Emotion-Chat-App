import 'package:equatable/equatable.dart';

abstract class ValueObject<T> extends Equatable {
  const ValueObject();
  T get value;
  bool isValid();
  ValueObject<T> copyWith({
    required T value,
  });
}
