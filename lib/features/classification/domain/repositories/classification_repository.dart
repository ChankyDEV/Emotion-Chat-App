import 'package:emotion_chat/features/chat/domain/entities/content.dart';
import 'package:emotion_chat/features/classification/data/dtos/sentiment_analysis_dto.dart';

abstract class ClassificationRepository {
  Future<SentimentAnalysisDTO> getSentimentAnalysis(
    Content content,
  );
}
