import 'package:emotion_chat/utils/domain/value_object.dart';

class Content extends ValueObject<String> {
  const Content({required this.value});

  @override
  bool isValid() {
    if (this.value.isNotEmpty) {
      return true;
    }
    return false;
  }

  @override
  List<Object> get props => [value];

  @override
  final String value;

  @override
  Content copyWith({required String value}) {
    return Content(
      value: value,
    );
  }
}
