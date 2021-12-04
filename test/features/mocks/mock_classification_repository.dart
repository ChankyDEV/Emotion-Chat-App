import 'package:emotion_chat/features/chat/domain/entities/content.dart';
import 'package:emotion_chat/features/classification/data/dtos/sentiment_analysis_dto.dart';
import 'package:emotion_chat/features/classification/domain/repositories/classification_repository.dart';
import 'package:mockito/mockito.dart';

class MockClassificationRepository extends Mock
    implements ClassificationRepository {
  @override
  Future<SentimentAnalysisDTO> getSentimentAnalysis(
    Content? content,
  ) {
    return super.noSuchMethod(
      Invocation.method(#toDomain, [content]),
      returnValue: Future.value(
        SentimentAnalysisDTO.empty(),
      ),
      returnValueForMissingStub: Future.value(
        SentimentAnalysisDTO.empty(),
      ),
    );
  }
}
