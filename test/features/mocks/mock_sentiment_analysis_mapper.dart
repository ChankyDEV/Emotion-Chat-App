import 'package:emotion_chat/features/classification/data/dtos/sentiment_analysis_dto.dart';
import 'package:emotion_chat/features/classification/data/mappers/sentiment_analysis_mapper.dart';
import 'package:emotion_chat/features/classification/domain/entities/sentiment_analysis.dart';
import 'package:mockito/mockito.dart';

class MockSentimentAnalysisMapper extends Mock
    implements SentimentAnalysisMapper {
  @override
  SentimentAnalysis toDomain(SentimentAnalysisDTO? analysis) {
    return super.noSuchMethod(
      Invocation.method(#toDomain, [analysis]),
      returnValue: SentimentAnalysis.empty(),
      returnValueForMissingStub: SentimentAnalysis.empty(),
    );
  }
}
