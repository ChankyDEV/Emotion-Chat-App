import 'package:dartz/dartz.dart';
import 'package:emotion_chat/features/chat/domain/entities/content.dart';
import 'package:emotion_chat/features/classification/data/dtos/sentiment_analysis_dto.dart';
import 'package:emotion_chat/features/classification/data/services/classification_service_impl.dart';
import 'package:emotion_chat/features/classification/domain/entities/sentiment_analysis.dart';
import 'package:emotion_chat/features/classification/domain/services/classification_service.dart';
import 'package:emotion_chat/utils/data/utils/error_messages.dart';
import 'package:emotion_chat/utils/data/utils/exceptions.dart';
import 'package:emotion_chat/utils/domain/failure.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../utils/mocks.dart';
import '../../mocks/mock_classification_repository.dart';
import '../../mocks/mock_sentiment_analysis_mapper.dart';

void main() {
  late final MockClassificationRepository repository;
  late final MockNetworkInfo networkInfo;
  late final MockSentimentAnalysisMapper mapper;
  late final ClassificationService service;

  setUpAll(() {
    repository = MockClassificationRepository();
    mapper = MockSentimentAnalysisMapper();
    networkInfo = MockNetworkInfo();
    service = ClassificationServiceImpl(repository, mapper, networkInfo);
  });

  void _mockNetworkConnection({required bool hasConnection}) =>
      when(networkInfo.isConnected).thenAnswer((_) async => hasConnection);

  const content = Content(value: 'test');
  const sadness = 0.43;
  const other = 0.67;
  const expected = SentimentAnalysis(content, sadness, other);
  final dto = SentimentAnalysisDTO(content.value, sadness, other);
  final errMsg = ErrorMessages.classification.error;
  final exception = ClassificationException(message: errMsg);
  final failure = Failure(message: errMsg);
  final internetFailure = Failure(message: ErrorMessages.internet.noConnection);
  group('getSentimentAnalysis', () {
    test('should return right(SentimentAnalysis) if there is no error',
        () async {
      _mockNetworkConnection(hasConnection: true);
      when(repository.getSentimentAnalysis(any)).thenAnswer((_) async => dto);
      when(mapper.toDomain(any)).thenReturn(expected);
      final actual = await service.getSentimentAnalysis(content);
      expect(actual, right(expected));
    });

    test('should return left(Failure) if there is an error', () async {
      _mockNetworkConnection(hasConnection: true);
      when(repository.getSentimentAnalysis(any)).thenThrow(exception);
      final actual = await service.getSentimentAnalysis(content);
      expect(
        actual,
        left(failure),
      );
    });

    test('should return left(Failure) if there is not internet connection',
        () async {
      _mockNetworkConnection(hasConnection: false);
      final actual = await service.getSentimentAnalysis(content);
      expect(actual, left(internetFailure));
    });
  });
}
