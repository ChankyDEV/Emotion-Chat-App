import 'package:emotion_chat/features/classification/domain/entities/sentiment_analysis.dart';

class SentimentAnalysisDTO extends SentimentAnalysis {
  SentimentAnalysisDTO(
    double sadness,
    double other,
  ) : super(
          sadness,
          other,
        );

  factory SentimentAnalysisDTO.empty() => SentimentAnalysisDTO(-1, -1);

  factory SentimentAnalysisDTO.fromJson(
    Map<String, dynamic> json,
  ) =>
      SentimentAnalysisDTO(json['sadness'], json['other']);
}
