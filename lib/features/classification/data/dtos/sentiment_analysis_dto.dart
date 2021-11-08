import 'package:emotion_chat/features/chat/domain/entities/content.dart';
import 'package:emotion_chat/features/classification/domain/entities/sentiment_analysis.dart';

class SentimentAnalysisDTO extends SentimentAnalysis {
  SentimentAnalysisDTO(
    String message,
    double sadness,
    double other,
  ) : super(
          Content(value: message),
          sadness,
          other,
        );

  factory SentimentAnalysisDTO.empty() => SentimentAnalysisDTO('', -1, -1);

  factory SentimentAnalysisDTO.fromJson(
    Map<String, dynamic> json,
    Content content,
  ) =>
      SentimentAnalysisDTO(content.value, json['sadness'], json['other']);
}
