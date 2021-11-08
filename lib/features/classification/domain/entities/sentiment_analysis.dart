import 'package:emotion_chat/features/chat/domain/entities/content.dart';
import 'package:equatable/equatable.dart';

class SentimentAnalysis extends Equatable {
  final Content content;
  final double sadness;
  final double other;

  const SentimentAnalysis(
    this.content,
    this.sadness,
    this.other,
  );

  factory SentimentAnalysis.empty() =>
      SentimentAnalysis(Content(value: ''), -1, -1);

  @override
  List<Object?> get props => [content, sadness, other];

  @override
  bool? get stringify => true;
}
