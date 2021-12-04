import 'package:emotion_chat/features/classification/data/dtos/sentiment_analysis_dto.dart';
import 'package:emotion_chat/features/classification/domain/entities/sentiment_analysis.dart';

class SentimentAnalysisMapper {
  SentimentAnalysisDTO fromDomain(SentimentAnalysis analysis) {
    return SentimentAnalysisDTO(
      analysis.sadness,
      analysis.other,
    );
  }

  SentimentAnalysis toDomain(SentimentAnalysisDTO analysis) => analysis;
}
