import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:emotion_chat/features/chat/domain/entities/content.dart';
import 'package:emotion_chat/features/classification/data/dtos/sentiment_analysis_dto.dart';
import 'package:emotion_chat/features/classification/data/repositories/classification_repository_impl.dart';
import 'package:emotion_chat/features/classification/domain/repositories/classification_repository.dart';
import 'package:emotion_chat/utils/data/utils/exceptions.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../fixtures/fixture_reader.dart';
import '../../mocks/mock_dio.dart';

void main() {
  late ClassificationRepository repository;
  late MockDio dio;
  setUpAll(() {
    dio = MockDio();
    repository = ClassificationRepositoryImpl(dio);
  });
  final url = 'http://192.168.0.107:5000/text_classification';
  const content = Content(value: 'test');
  final expected = SentimentAnalysisDTO(0.1, 0.9);
  final queryParameters = {
    'message': content.value,
  };
  test(
    'should return SentimentAnalysisDTO from body if status code is ok',
    () async {
      when(dio.post(url, queryParameters: queryParameters)).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(path: url),
          data: jsonDecode(fixture('sentimentAnalysis.json')),
          statusCode: 200,
        ),
      );
      final actual = await repository.getSentimentAnalysis(content);
      expect(actual, expected);
    },
  );

  test(
    'should throw ClassificationException if status code is not ok',
    () async {
      when(dio.post(url, queryParameters: queryParameters)).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(path: url),
          data: jsonDecode(fixture('sentimentAnalysis.json')),
          statusCode: 404,
        ),
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
