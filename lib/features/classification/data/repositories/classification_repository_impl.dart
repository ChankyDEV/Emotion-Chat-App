import 'dart:convert';

import 'package:emotion_chat/features/chat/domain/entities/content.dart';
import 'package:emotion_chat/features/classification/data/dtos/sentiment_analysis_dto.dart';
import 'package:emotion_chat/features/classification/domain/repositories/classification_repository.dart';
import 'package:emotion_chat/utils/data/utils/error_messages.dart';
import 'package:emotion_chat/utils/data/utils/exceptions.dart';
import 'package:http/http.dart';

class ClassificationRepositoryImpl implements ClassificationRepository {
  final Client _client;

  ClassificationRepositoryImpl(this._client);

  final _url = '127.0.0.1:5000';
  final String _path = '/text_classification';

  @override
  Future<SentimentAnalysisDTO> getSentimentAnalysis(Content content) async {
    final queryParameters = {
      'message': content.value,
    };
    final response = await _client.post(Uri.http(
      '127.0.0.1:5000',
      _path,
      queryParameters,
    ));
    if (response.statusCode == 200) {
      return SentimentAnalysisDTO.fromJson(jsonDecode(response.body));
    } else {
      throw ClassificationException(
          message: ErrorMessages.classification.error);
    }
  }
}
