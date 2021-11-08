import 'package:emotion_chat/features/chat/domain/entities/content.dart';
import 'package:emotion_chat/features/classification/data/dtos/sentiment_analysis_dto.dart';
import 'package:emotion_chat/features/classification/data/repositories/classification_repository_impl.dart';
import 'package:emotion_chat/features/classification/domain/repositories/classification_repository.dart';
import 'package:emotion_chat/utils/data/utils/exceptions.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';

import '../../../fixtures/fixture_reader.dart';
import '../../mocks/mock_client.dart';

void main() {
  late ClassificationRepository repository;
  late MockClient client;
  setUpAll(() {
    client = MockClient();
    repository = ClassificationRepositoryImpl(client);
  });
  const String url = 'http://127.0.0.1:5000/text_classification';
  const content = Content(value: 'test');
  final expected = SentimentAnalysisDTO(content.value, 0.1, 0.9);

  test(
    'should return SentimentAnalysisDTO from body if status code is ok',
    () async {
      when(client.get(
        Uri(path: '$url/${content.value}'),
        headers: {
          'Content-Type': 'application/json',
        },
      )).thenAnswer(
        (_) async => Response(fixture('sentimentAnalysis.json'), 200),
      );
      final actual = await repository.getSentimentAnalysis(content);
      expect(actual, expected);
    },
  );

  test(
    'should throw ClassificationException if status code is not ok',
    () async {
      when(client.get(
        Uri(path: '$url/${content.value}'),
        headers: {
          'Content-Type': 'application/json',
        },
      )).thenAnswer(
        (_) async => Response(fixture('sentimentAnalysis.json'), 404),
      );
      final call = repository.getSentimentAnalysis;
      expect(
        () => call(content),
        throwsA(
          isA<ClassificationException>(),
        ),
      );
    },
  );
}
